describe 'Eligible::V1_0::PatientStatement' do
  let(:params) { { rest_api_version: '1.0' } }
  let(:api_key) { 'xyz' }
  let(:response) { { success: true } }
  before(:each) do
    allow(Eligible::Util).to receive(:convert_to_eligible_object).with(response, api_key).and_return('success')
  end

  describe '.retrieve' do
    it 'should call Eligible.request with proper url' do
      params[:id] = 'pst_9bcb7c733e0242439575a299'
      allow(Eligible).to receive(:request).with(:get, '/patient_statements/pst_9bcb7c733e0242439575a299', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::V1_0::PatientStatement.retrieve(params[:id], api_key: api_key)).to eq 'success'
    end

    it 'should raise error if patient_statement id is not present' do
      expect { Eligible::V1_0::PatientStatement.retrieve(nil, api_key: api_key) }.to raise_error(ArgumentError)
    end
  end

  describe '.create' do
    it 'should post to Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:post, '/patient_statements', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::V1_0::PatientStatement.create(params, api_key: api_key)).to eq 'success'
    end
  end

  describe '.list' do
    it 'should call Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:get, '/patient_statements', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::V1_0::PatientStatement.list(params, api_key: api_key)).to eq 'success'
    end
  end

  describe '.update' do
    it 'should call Eligible.request with proper url' do
      params[:id] = 'pst_9bcb7c733e0242439575a299'
      allow(Eligible).to receive(:request).with(:put, '/patient_statements/pst_9bcb7c733e0242439575a299', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::V1_0::PatientStatement.update(params, api_key: api_key)).to eq 'success'
    end

    it 'should raise error if patient_statement id is not present' do
      expect { Eligible::V1_0::PatientStatement.update(params, api_key: api_key) }.to raise_error(ArgumentError)
    end
  end

  describe "patient_statement events" do
    context '.finalize' do
      it 'should call Eligible.request with proper url' do
        params[:id] = 'pst_9bcb7c733e0242439575a299'
        allow(Eligible).to receive(:request).with(:post, '/patient_statements/pst_9bcb7c733e0242439575a299/finalize', api_key, params, {}).and_return([response, api_key])
        expect(Eligible::V1_0::PatientStatement.finalize(params[:id], api_key: api_key)).to eq 'success'
      end

      it 'should raise error if patient_statement id is not present' do
        expect { Eligible::V1_0::PatientStatement.finalize(nil, api_key: api_key) }.to raise_error(ArgumentError)
      end
    end

    context '.pay' do
      it 'should call Eligible.request with proper url' do
        params[:id] = 'pst_9bcb7c733e0242439575a299'
        allow(Eligible).to receive(:request).with(:post, '/patient_statements/pst_9bcb7c733e0242439575a299/payment_reports', api_key, params, {}).and_return([response, api_key])
        expect(Eligible::V1_0::PatientStatement.pay(params, api_key: api_key)).to eq 'success'
      end

      it 'should raise error if patient_statement id is not present' do
        expect { Eligible::V1_0::PatientStatement.pay(params, api_key: api_key) }.to raise_error(ArgumentError)
      end
    end

    context '.payments' do
      it 'should call Eligible.request with proper url' do
        params[:id] = 'pst_9bcb7c733e0242439575a299'
        allow(Eligible).to receive(:request).with(:get, '/patient_statements/pst_9bcb7c733e0242439575a299/payment_reports', api_key, params, {}).and_return([response, api_key])
        expect(Eligible::V1_0::PatientStatement.payments(params, api_key: api_key)).to eq 'success'
      end

      it 'should raise error if patient_statement id is not present' do
        expect { Eligible::V1_0::PatientStatement.payments(params, api_key: api_key) }.to raise_error(ArgumentError)
      end
    end

    context '.process' do
      it 'should call Eligible.request with proper url' do
        params[:id] = 'pst_9bcb7c733e0242439575a299'
        allow(Eligible).to receive(:request).with(:post, '/patient_statements/pst_9bcb7c733e0242439575a299/process', api_key, params, {}).and_return([response, api_key])
        expect(Eligible::V1_0::PatientStatement.process(params, api_key: api_key)).to eq 'success'
      end

      it 'should raise error if patient_statement id is not present' do
        expect { Eligible::V1_0::PatientStatement.process(params, api_key: api_key) }.to raise_error(ArgumentError)
      end
    end

    context '.capture' do
      it 'should call Eligible.request with proper url' do
        params[:id] = 'pst_9bcb7c733e0242439575a299'
        allow(Eligible).to receive(:request).with(:post, '/patient_statements/pst_9bcb7c733e0242439575a299/capture', api_key, params, {}).and_return([response, api_key])
        expect(Eligible::V1_0::PatientStatement.capture(params, api_key: api_key)).to eq 'success'
      end

      it 'should raise error if patient_statement id is not present' do
        expect { Eligible::V1_0::PatientStatement.capture(params, api_key: api_key) }.to raise_error(ArgumentError)
      end
    end

    context '.send' do
      it 'should call Eligible.request with proper url' do
        params[:id] = 'pst_9bcb7c733e0242439575a299'
        allow(Eligible).to receive(:request).with(:post, '/patient_statements/pst_9bcb7c733e0242439575a299/send', api_key, params, {}).and_return([response, api_key])
        expect(Eligible::V1_0::PatientStatement.send(params[:id], api_key: api_key)).to eq 'success'
      end

      it 'should raise error if patient_statement id is not present' do
        expect { Eligible::V1_0::PatientStatement.send(nil, api_key: api_key) }.to raise_error(ArgumentError)
      end
    end

    context '.void' do
      it 'should call Eligible.request with proper url' do
        params[:id] = 'pst_9bcb7c733e0242439575a299'
        allow(Eligible).to receive(:request).with(:post, '/patient_statements/pst_9bcb7c733e0242439575a299/void', api_key, params, {}).and_return([response, api_key])
        expect(Eligible::V1_0::PatientStatement.void(params[:id], api_key: api_key)).to eq 'success'
      end

      it 'should raise error if patient_statement id is not present' do
        expect { Eligible::V1_0::PatientStatement.void(nil, api_key: api_key) }.to raise_error(ArgumentError)
      end
    end

    context '.mark_uncollectible' do
      it 'should call Eligible.request with proper url' do
        params[:id] = 'pst_9bcb7c733e0242439575a299'
        allow(Eligible).to receive(:request).with(:post, '/patient_statements/pst_9bcb7c733e0242439575a299/mark_uncollectible', api_key, params, {}).and_return([response, api_key])
        expect(Eligible::V1_0::PatientStatement.mark_uncollectible(params[:id], api_key: api_key)).to eq 'success'
      end

      it 'should raise error if patient_statement id is not present' do
        expect { Eligible::V1_0::PatientStatement.mark_uncollectible(nil, api_key: api_key) }.to raise_error(ArgumentError)
      end
    end

    context '.reestimate' do
      it 'should call Eligible.request with proper url' do
        params[:id] = 'pst_9bcb7c733e0242439575a299'
        allow(Eligible).to receive(:request).with(:post, '/patient_statements/pst_9bcb7c733e0242439575a299/reestimate', api_key, params, {}).and_return([response, api_key])
        expect(Eligible::V1_0::PatientStatement.reestimate(params, api_key: api_key)).to eq 'success'
      end

      it 'should raise error if patient_statement id is not present' do
        expect { Eligible::V1_0::PatientStatement.reestimate(params, api_key: api_key) }.to raise_error(ArgumentError)
      end
    end

    context '.submit_claim' do
      it 'should call Eligible.request with proper url' do
        params[:id] = 'pst_9bcb7c733e0242439575a299'
        params.merge!({
            "network": "out",
            "diagnosis_codes": [
                "F01.50"
            ],
            "diagnosis_code_pointers": [
                "1"
            ],
            "units": "1",
            "dates": {
               "service_date_from": "2018-08-23",
               "service_date_to": "2018-08-23"
            },
            "place_of_service": "11"
        })
        allow(Eligible).to receive(:request).with(:post, '/patient_statements/pst_9bcb7c733e0242439575a299/submit_claim', api_key, params, {}).and_return([response, api_key])
        expect(Eligible::V1_0::PatientStatement.submit_claim(params, api_key: api_key)).to eq 'success'
      end

      it 'should raise error if patient_statement id is not present' do
        expect { Eligible::V1_0::PatientStatement.submit_claim(params, api_key: api_key) }.to raise_error(ArgumentError)
      end
    end
  end
end
