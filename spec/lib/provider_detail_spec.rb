describe 'Eligible::ProviderDetail' do
  let(:params) { { test: true } }
  let(:api_key) { 'xyz' }
  let(:response) { { success: true } }

  before(:each) do
    allow(Eligible::Util).to receive(:convert_to_eligible_object).with(response, api_key).and_return('success')
  end

  describe '.list' do
    it 'should call Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:get, '/provider_details.json', api_key, params).and_return([response, api_key])
      expect(Eligible::ProviderDetail.get(params, api_key)).to eq 'success'
    end

    it 'should raise error if invalid api key is used' do
      expect { Eligible::ProviderDetail.get(params, api_key) }.to raise_error do |error|
        expect(error).to be_a(Eligible::APIError)
        message = 'Invalid response object from API: "Could not authenticate you. Please re-try with a valid API key." (HTTP response code was 401)'
        expect(error.message).to eql message
      end
    end
  end
end
