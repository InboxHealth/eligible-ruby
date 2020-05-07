describe 'Eligible::V1_0::Provider' do
  let(:params) { { rest_api_version: '1.0' } }
  let(:api_key) { 'xyz' }
  let(:response) { { success: true } }
  before(:each) do
    allow(Eligible::Util).to receive(:convert_to_eligible_object).with(response, api_key).and_return('success')
    allow(Eligible::V1_0::Provider).to receive(:endpoint_name).and_return('providers')
  end

  describe '.retrieve' do
    it 'should call Eligible.request with proper url' do
      params[:id] = 'prov_9bcb7c733e0242439575a299'
      allow(Eligible).to receive(:request).with(:get, '/providers/prov_9bcb7c733e0242439575a299', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::V1_0::Provider.retrieve(params[:id], api_key: api_key)).to eq 'success'
    end

    it 'should raise error if charge id is not present' do
      expect { Eligible::V1_0::Provider.retrieve(nil, api_key: api_key) }.to raise_error(ArgumentError)
    end
  end

  describe '.create' do
    it 'should post to Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:post, '/providers', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::V1_0::Provider.create(params, api_key: api_key)).to eq 'success'
    end
  end

  describe '.list' do
    it 'should call Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:get, '/providers', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::V1_0::Provider.list(params, api_key: api_key)).to eq 'success'
    end
  end

  describe '.update' do
    it 'should call Eligible.request with proper url' do
      params[:id] = 'prov_9bcb7c733e0242439575a299'
      allow(Eligible).to receive(:request).with(:put, '/providers/prov_9bcb7c733e0242439575a299', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::V1_0::Provider.update(params, api_key: api_key)).to eq 'success'
    end

    it 'should raise error if charge id is not present' do
      expect { Eligible::V1_0::Provider.update(params, api_key: api_key) }.to raise_error(ArgumentError)
    end
  end

  describe '.delete' do
    it 'should call Eligible.request with proper url' do
      params[:id] = 'prov_9bcb7c733e0242439575a299'
      allow(Eligible).to receive(:request).with(:delete, '/providers/prov_9bcb7c733e0242439575a299', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::V1_0::Provider.delete(params, api_key: api_key)).to eq 'success'
    end
  end
end
