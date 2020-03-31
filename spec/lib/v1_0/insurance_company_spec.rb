describe 'Eligible::InsuranceCompany' do
  let(:params) { { rest_api_version: '1.0' } }
  let(:api_key) { 'xyz' }
  let(:response) { { success: true } }
  before(:each) do
    allow(Eligible::Util).to receive(:convert_to_eligible_object).with(response, api_key).and_return('success')
    allow(Eligible::InsuranceCompany).to receive(:endpoint_name).and_return('insurance_companies')
  end

  describe '.retrieve' do
    it 'should call Eligible.request with proper url' do
      params[:id] = 'ins_9bcb7c733e0242439575a299'
      allow(Eligible).to receive(:request).with(:get, '/insurance_companies/ins_9bcb7c733e0242439575a299', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::InsuranceCompany.retrieve(params[:id], api_key: api_key)).to eq 'success'
    end

    it 'should raise error if insurance policy id is not present' do
      expect { Eligible::InsuranceCompany.retrieve(nil, api_key: api_key) }.to raise_error(ArgumentError)
    end
  end

  describe '.list' do
    it 'should call Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:get, '/insurance_companies', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::InsuranceCompany.list(params, api_key: api_key)).to eq 'success'
    end
  end
end
