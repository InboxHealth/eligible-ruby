describe Eligible do
  let(:response) {  double("response", body: "{\"success\": \"true\"}", code: 200) }

  it 'has a version number' do
    expect(Eligible::VERSION).to_not be_nil
  end

  context "Connection" do
    it 'fails when certificate presented does not match embedded fingerprint' do
      Eligible.api_key = "foo"
      allow(Eligible).to receive(:valid_fingerprint?).and_return(false)
      expect { Eligible::Coverage.get({}) }.to raise_error(Eligible::APIConnectionError)
    end

    it 'should not warn about ignoring ssl_verify_callback return code' do
      allow(Eligible).to receive(:valid_fingerprint?).and_return(true)
      allow_any_instance_of(RestClient::Request).to receive(:process_result).and_return(response)
      expect { Eligible::Coverage.get({}) }.not_to output("warning: ssl_verify_callback return code is ignored on OS X\npass :ssl_verify_callback_warnings => false to silence this\n").to_stderr
    end

    it 'warns when the fingerprint is overridden' do
      expect { Eligible.add_fingerprint('foo') }.to output("The embedded certificate fingerprint was modified. This should only be done if instructed to by eligible support staff\n").to_stderr
    end

    it 'raises an error when api credentials are not provided' do
      Eligible.api_key = nil
      expect { Eligible::Coverage.get({}) }.to raise_error(Eligible::AuthenticationError)
    end
  end

  context '.error_message' do
    it "should return a string when passed a string value" do
      error = "foo"
      expect(Eligible.error_message(error, nil)).to eq(error)
    end

    it "should return message from errors array" do
      error = nil
      errors = [{message: 'foo'}]
      expect(Eligible.error_message(error, errors)).to eq('foo')
    end

    it "should return message from errors array with multiple errors" do
      error = nil
      errors = [{message: 'foo'}, {message: 'bar'}]
      expect(Eligible.error_message(error, errors)).to eq("1. foo\n2. bar")
    end

    it "should convert non-hash scalar values to strings" do
      expect(Eligible.error_message(42, nil)).to eq("42")
      expect(Eligible.error_message(true, nil)).to eq("true")
    end

    it "should convert array values to strings" do
      arr = [ 1, 2, 3 ]
      expect(Eligible.error_message(arr, nil)).to eq(arr.to_s)
    end

    context "when called with a Hash argument" do
      it "should return :details value if available" do
        err = { details: 'foo', bar: 'bar' }
        expect(Eligible.error_message(err, nil)).to eq('foo')
      end

      it "should return :reject_reason_description value if available" do
        err = { reject_reason_description: 'bar', foo: 'foo' }
        expect(Eligible.error_message(err, nil)).to eq('bar')
      end

      it "should prefer :details over :reject_reason_description" do
        err = { details: 'foo', reject_reason_description: 'bar' }
        expect(Eligible.error_message(err, nil)).to eq('foo')
      end

      it "should convert the hash to string if no special keys found" do
        err = { foo: 'foo', bar: 'bar' }
        expect(Eligible.error_message(err, nil)).to eq(err.to_s)
      end
    end
  end

  context '.fetch_url_with_query_string' do
    let(:params) { { key1: 'test' } }
    let(:api_key) { 'xyz' }
    let(:response) { { success: true } }
    let(:url) { '/test/url' }
    let(:options) { { test: false, api_key: api_key, basic_auth: true } }

    it "should return a url with query string without having test and api_key when basic_auth is true" do
      expect(Eligible.fetch_url_with_query_string(params, url, options)).to eq "/test/url?key1=test"
    end

    it "should return a url with query string with having test and api_key when basic_auth is false" do
      expect(Eligible.fetch_url_with_query_string(params, url, options.merge(basic_auth: false))).to eq "/test/url?test=false&api_key=xyz&key1=test"
    end
  end

  context '.generate_request_url_and_payload' do
    let(:params) { { key1: 'test', rest_api_version: '1.0' } }
    let(:api_key) { 'xyz' }
    let(:response) { { success: true } }
    let(:url) { '/test/url' }
    let(:options) { { test: false, api_key: api_key, basic_auth: true, rest_api_version: '1.0' } }

    context "when basic_auth is used" do
      it "should ignore test, rest_api_version and api_key params while generating a url and request payload when basic_auth is true" do
        expect(Eligible.generate_request_url_and_payload("GET", url, params, options)).to match_array ["https://gds.eligibleapi.com/v1.0/test/url?key1=test", nil]
      end

      it "should ignore test, rest_api_version and api_key params while generating a url and request payload for POST request" do
        expect(Eligible.generate_request_url_and_payload("POST", url, params, options)).to match_array ["https://gds.eligibleapi.com/v1.0/test/url", {"key1":"test"}.to_json]
      end
    end

    context "when basic_auth is not used" do
      it "should accept test and api_key params while generating a url and request payload" do
        expect(Eligible.generate_request_url_and_payload("GET", url, params, options.merge(basic_auth: false))).to match_array ["https://gds.eligibleapi.com/v1.0/test/url?test=false&api_key=xyz&key1=test", nil]
      end

      it "should accept test and api_key params while generating a url and request payload for POST request" do
        expect(Eligible.generate_request_url_and_payload("POST", url, params, options.merge(basic_auth: false))).to match_array ["https://gds.eligibleapi.com/v1.0/test/url", {"key1":"test","test":false,"api_key":"xyz"}.to_json]
      end
    end
  end

  context "error handling" do
    let(:error_response_single) {
      double("response", body: %q(
        {"eligible_id":"UWHP1FPJQQE43",
         "success":false,
         "created_at":"2016-05-26T16:32:04Z",
         "errors":[{"code":"invalid_request_error",
                    "message":"provider_price should be present and should be a valid price",
                    "param":"provider_price","expected_value":null}]}
      ),code: "400")
    }

    let(:error_response_multiple) {
      double("response", body: %q(
        {"eligible_id":"UWHP1FPJQQE43",
         "success":false,
         "created_at":"2016-05-26T16:32:04Z",
         "errors":[{"code":"invalid_request_error",
                    "message":"provider_price should be present and should be a valid price",
                    "param":"provider_price","expected_value":null},
                   {"code":"invalid_request_error",
                    "message":"network should be present and should be either IN or OUT",
                    "param":"network","expected_value":null}]}
      ),code: "400")
    }

    it 'will return errors for single error' do
      Eligible.api_key = "xyz"
      expect(RestClient::Request).to receive(:execute).and_raise(RestClient::ExceptionWithResponse.new(error_response_single))
      expect { Eligible::Coverage.get({}) }.to raise_error do |error|
        expect(error).to be_a(Eligible::EligibleError)
        expect(error.message).to eq("provider_price should be present and should be a valid price")
        expect(error.errors).to eq([{ code: "invalid_request_error", message: "provider_price should be present and should be a valid price", param: "provider_price", expected_value: nil }])
      end
    end

    it 'will return errors for multiple error' do
      Eligible.api_key = "xyz"
      expect(RestClient::Request).to receive(:execute).and_raise(RestClient::ExceptionWithResponse.new(error_response_multiple))
      expect { Eligible::Coverage.get({}) }.to raise_error do |error|
        expect(error).to be_a(Eligible::EligibleError)
        expect(error.message).to eq("1. provider_price should be present and should be a valid price\n2. network should be present and should be either IN or OUT")
        expect(error.errors).to eq([{ code: "invalid_request_error", message: "provider_price should be present and should be a valid price", param: "provider_price", expected_value: nil },
                                    { code: "invalid_request_error", message: "network should be present and should be either IN or OUT", param: "network", expected_value: nil }])
      end
    end
  end
end
