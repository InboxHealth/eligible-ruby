describe 'Eligible::V1_0::Attribute' do
  let(:params) { { rest_api_version: '1.0' } }
  let(:api_key) { 'xyz' }
  let(:response) { { success: true } }
  before(:each) do
    allow(Eligible::Util).to receive(:convert_to_eligible_object).with(response, api_key).and_return('success')
  end

  describe '.retrieve' do
    it 'should call Eligible.request with proper url' do
      params[:id] = 'attr_9bcb7c733e0242439575a299'
      allow(Eligible).to receive(:request).with(:get, '/rules/attributes/attr_9bcb7c733e0242439575a299', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::V1_0::Attribute.retrieve(params[:id], api_key: api_key)).to eq 'success'
    end

    it 'should raise error if attribute id is not present' do
      expect { Eligible::V1_0::Attribute.retrieve(nil, api_key: api_key) }.to raise_error(ArgumentError)
    end
  end

  describe '.create' do
    it 'should post to Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:post, '/rules/attributes', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::V1_0::Attribute.create(params, api_key: api_key)).to eq 'success'
    end
  end

  describe '.list' do
    it 'should call Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:get, '/rules/attributes', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::V1_0::Attribute.list(params, api_key: api_key)).to eq 'success'
    end
  end

  describe '.update' do
    it 'should call Eligible.request with proper url' do
      params[:id] = 'attr_9bcb7c733e0242439575a299'
      allow(Eligible).to receive(:request).with(:put, '/rules/attributes/attr_9bcb7c733e0242439575a299', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::V1_0::Attribute.update(params, api_key: api_key)).to eq 'success'
    end

    it 'should raise error if attribute id is not present' do
      expect { Eligible::V1_0::Attribute.update(params, api_key: api_key) }.to raise_error(ArgumentError)
    end
  end

  describe '.delete' do
    it 'should call Eligible.request with proper url' do
      params[:id] = 'attr_9bcb7c733e0242439575a299'
      allow(Eligible).to receive(:request).with(:delete, '/rules/attributes/attr_9bcb7c733e0242439575a299', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::V1_0::Attribute.delete(params, api_key: api_key)).to eq 'success'
    end
  end
end
