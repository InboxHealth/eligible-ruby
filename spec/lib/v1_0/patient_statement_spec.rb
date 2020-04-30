describe 'Eligible::PatientStatement' do
  let(:params) { { rest_api_version: '1.0' } }
  let(:api_key) { 'xyz' }
  let(:response) { { success: true } }
  before(:each) do
    allow(Eligible::Util).to receive(:convert_to_eligible_object).with(response, api_key).and_return('success')
    allow(Eligible::PatientStatement).to receive(:endpoint_name).and_return('patient_statements')
  end

  describe '.retrieve' do
    it 'should call Eligible.request with proper url' do
      params[:id] = 'pst_9bcb7c733e0242439575a299'
      allow(Eligible).to receive(:request).with(:get, '/patient_statements/pst_9bcb7c733e0242439575a299', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::PatientStatement.retrieve(params[:id], api_key: api_key)).to eq 'success'
    end

    it 'should raise error if patient_statement id is not present' do
      expect { Eligible::PatientStatement.retrieve(nil, api_key: api_key) }.to raise_error(ArgumentError)
    end
  end

  describe '.create' do
    it 'should post to Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:post, '/patient_statements', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::PatientStatement.create(params, api_key: api_key)).to eq 'success'
    end
  end

  describe '.list' do
    it 'should call Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:get, '/patient_statements', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::PatientStatement.list(params, api_key: api_key)).to eq 'success'
    end
  end

  describe '.update' do
    it 'should call Eligible.request with proper url' do
      params[:id] = 'pst_9bcb7c733e0242439575a299'
      allow(Eligible).to receive(:request).with(:put, '/patient_statements/pst_9bcb7c733e0242439575a299', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::PatientStatement.update(params, api_key: api_key)).to eq 'success'
    end

    it 'should raise error if patient_statement id is not present' do
      expect { Eligible::PatientStatement.update(params, api_key: api_key) }.to raise_error(ArgumentError)
    end
  end

  describe "patient_statement events" do

    before(:each) do
      allow(Eligible::PatientStatement).to receive(:statement_id).with(params).and_return('pst_9bcb7c733e0242439575a299')
    end

    context '.finalize' do
      it 'should call Eligible.request with proper url' do
        params[:id] = 'pst_9bcb7c733e0242439575a299'
        allow(Eligible::PatientStatement).to receive(:statement_id).with(params[:id]).and_return('pst_9bcb7c733e0242439575a299')
        allow(Eligible).to receive(:request).with(:post, '/patient_statements/pst_9bcb7c733e0242439575a299/finalize', api_key, params, {}).and_return([response, api_key])
        expect(Eligible::PatientStatement.finalize(params[:id], api_key: api_key)).to eq 'success'
      end

      it 'should raise error if patient_statement id is not present' do
        allow(Eligible::PatientStatement).to receive(:statement_id).with(params[:id]).and_return('pst_9bcb7c733e0242439575a299')
        expect { Eligible::PatientStatement.finalize(nil, api_key: api_key) }.to raise_error(ArgumentError)
      end
    end

    context '.pay' do
      it 'should call Eligible.request with proper url' do
        params[:id] = 'pst_9bcb7c733e0242439575a299'
        allow(Eligible).to receive(:request).with(:post, '/patient_statements/pst_9bcb7c733e0242439575a299/payment_reports', api_key, params, {}).and_return([response, api_key])
        expect(Eligible::PatientStatement.pay(params, api_key: api_key)).to eq 'success'
      end

      it 'should raise error if patient_statement id is not present' do
        expect { Eligible::PatientStatement.pay(params, api_key: api_key) }.to raise_error(ArgumentError)
      end
    end

    context '.payments' do
      it 'should call Eligible.request with proper url' do
        params[:id] = 'pst_9bcb7c733e0242439575a299'
        allow(Eligible).to receive(:request).with(:get, '/patient_statements/pst_9bcb7c733e0242439575a299/payment_reports', api_key, params, {}).and_return([response, api_key])
        expect(Eligible::PatientStatement.payments(params, api_key: api_key)).to eq 'success'
      end

      it 'should raise error if patient_statement id is not present' do
        expect { Eligible::PatientStatement.payments(params, api_key: api_key) }.to raise_error(ArgumentError)
      end
    end

    context '.process' do
      it 'should call Eligible.request with proper url' do
        params[:id] = 'pst_9bcb7c733e0242439575a299'
        allow(Eligible).to receive(:request).with(:post, '/patient_statements/pst_9bcb7c733e0242439575a299/process', api_key, params, {}).and_return([response, api_key])
        expect(Eligible::PatientStatement.process(params, api_key: api_key)).to eq 'success'
      end

      it 'should raise error if patient_statement id is not present' do
        expect { Eligible::PatientStatement.process(params, api_key: api_key) }.to raise_error(ArgumentError)
      end
    end

    context '.capture' do
      it 'should call Eligible.request with proper url' do
        params[:id] = 'pst_9bcb7c733e0242439575a299'
        allow(Eligible).to receive(:request).with(:post, '/patient_statements/pst_9bcb7c733e0242439575a299/capture', api_key, params, {}).and_return([response, api_key])
        expect(Eligible::PatientStatement.capture(params, api_key: api_key)).to eq 'success'
      end

      it 'should raise error if patient_statement id is not present' do
        expect { Eligible::PatientStatement.capture(params, api_key: api_key) }.to raise_error(ArgumentError)
      end
    end

    context '.send' do
      it 'should call Eligible.request with proper url' do
        params[:id] = 'pst_9bcb7c733e0242439575a299'
        allow(Eligible::PatientStatement).to receive(:statement_id).with(params[:id]).and_return('pst_9bcb7c733e0242439575a299')
        allow(Eligible).to receive(:request).with(:post, '/patient_statements/pst_9bcb7c733e0242439575a299/send', api_key, params, {}).and_return([response, api_key])
        expect(Eligible::PatientStatement.send(params[:id], api_key: api_key)).to eq 'success'
      end

      it 'should raise error if patient_statement id is not present' do
        allow(Eligible::PatientStatement).to receive(:statement_id).with(params[:id]).and_return('pst_9bcb7c733e0242439575a299')
        expect { Eligible::PatientStatement.send(nil, api_key: api_key) }.to raise_error(ArgumentError)
      end
    end

    context '.void' do
      it 'should call Eligible.request with proper url' do
        params[:id] = 'pst_9bcb7c733e0242439575a299'
        allow(Eligible::PatientStatement).to receive(:statement_id).with(params[:id]).and_return('pst_9bcb7c733e0242439575a299')
        allow(Eligible).to receive(:request).with(:post, '/patient_statements/pst_9bcb7c733e0242439575a299/void', api_key, params, {}).and_return([response, api_key])
        expect(Eligible::PatientStatement.void(params[:id], api_key: api_key)).to eq 'success'
      end

      it 'should raise error if patient_statement id is not present' do
        allow(Eligible::PatientStatement).to receive(:statement_id).with(params[:id]).and_return('pst_9bcb7c733e0242439575a299')
        expect { Eligible::PatientStatement.void(nil, api_key: api_key) }.to raise_error(ArgumentError)
      end
    end

    context '.mark_uncollectible' do
      it 'should call Eligible.request with proper url' do
        params[:id] = 'pst_9bcb7c733e0242439575a299'
        allow(Eligible::PatientStatement).to receive(:statement_id).with(params[:id]).and_return('pst_9bcb7c733e0242439575a299')
        allow(Eligible).to receive(:request).with(:post, '/patient_statements/pst_9bcb7c733e0242439575a299/mark_uncollectible', api_key, params, {}).and_return([response, api_key])
        expect(Eligible::PatientStatement.mark_uncollectible(params[:id], api_key: api_key)).to eq 'success'
      end

      it 'should raise error if patient_statement id is not present' do
        allow(Eligible::PatientStatement).to receive(:statement_id).with(params[:id]).and_return('pst_9bcb7c733e0242439575a299')
        expect { Eligible::PatientStatement.mark_uncollectible(nil, api_key: api_key) }.to raise_error(ArgumentError)
      end
    end

    context '.reestimate' do
      it 'should call Eligible.request with proper url' do
        params[:id] = 'pst_9bcb7c733e0242439575a299'
        allow(Eligible::PatientStatement).to receive(:statement_id).with(params[:id]).and_return('pst_9bcb7c733e0242439575a299')
        allow(Eligible).to receive(:request).with(:post, '/patient_statements/pst_9bcb7c733e0242439575a299/reestimate', api_key, params, {}).and_return([response, api_key])
        expect(Eligible::PatientStatement.reestimate(params, api_key: api_key)).to eq 'success'
      end

      it 'should raise error if patient_statement id is not present' do
        allow(Eligible::PatientStatement).to receive(:statement_id).with(params[:id]).and_return('pst_9bcb7c733e0242439575a299')
        expect { Eligible::PatientStatement.reestimate(params, api_key: api_key) }.to raise_error(ArgumentError)
      end
    end
  end
end
