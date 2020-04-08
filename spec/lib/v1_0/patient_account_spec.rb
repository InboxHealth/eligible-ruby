describe 'Eligible::PatientAccount' do
  let(:params) { { rest_api_version: '1.0' } }
  let(:api_key) { 'xyz' }
  let(:response) { { success: true } }
  before(:each) do
    allow(Eligible::Util).to receive(:convert_to_eligible_object).with(response, api_key).and_return('success')
    allow(Eligible::Patient).to receive(:endpoint_name).and_return('patient_accounts')
  end

  describe '.retrieve' do
    it 'should call Eligible.request with proper url' do
      params[:id] = 'pa_9bcb7c733e0242439575a299'
      allow(Eligible).to receive(:request).with(:get, '/patient_accounts/pa_9bcb7c733e0242439575a299', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::PatientAccount.retrieve(params[:id], api_key: api_key)).to eq 'success'
    end

    it 'should raise error if patient id is not present' do
      expect { Eligible::PatientAccount.retrieve(nil, api_key: api_key) }.to raise_error(ArgumentError)
    end
  end

  describe '.create' do
    it 'should post to Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:post, '/patient_accounts', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::PatientAccount.create(params, api_key: api_key)).to eq 'success'
    end
  end

  describe '.list' do
    it 'should raises an exception saying not supported action' do
      expect { Eligible::PatientAccount.list(params, api_key: api_key) }.to raise_error("Not an allowed operation for this endpoint")
    end
  end

  describe '.update' do
    it 'should raises an exception saying not supported action' do
      expect { Eligible::PatientAccount.update(params, api_key: api_key) }.to raise_error("Not an allowed operation for this endpoint")
    end
  end
end
