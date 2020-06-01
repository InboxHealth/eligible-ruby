describe 'Eligible::V1_0::Rule' do
  let(:params) { { rest_api_version: '1.0' } }
  let(:api_key) { 'xyz' }
  let(:response) { { success: true } }
  before(:each) do
    allow(Eligible::Util).to receive(:convert_to_eligible_object).with(response, api_key).and_return('success')
  end

  describe '.retrieve' do
    it 'should call Eligible.request with proper url' do
      params[:id] = 'rul_9bcb7c733e0242439575a299'
      allow(Eligible).to receive(:request).with(:get, '/rules/rul_9bcb7c733e0242439575a299', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::V1_0::Rule.retrieve(params[:id], api_key: api_key)).to eq 'success'
    end

    it 'should raise error if rule id is not present' do
      expect { Eligible::V1_0::Rule.retrieve(nil, api_key: api_key) }.to raise_error(ArgumentError)
    end
  end

  describe '.list' do
    it 'should call Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:get, '/rules', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::V1_0::Rule.list(params, api_key: api_key)).to eq 'success'
    end
  end

  describe '.create' do
    it 'should send creation request' do
      allow(Eligible).to receive(:request).with(:post, '/rules', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::V1_0::Rule.create(params, api_key: api_key)).to eq 'success'
    end
  end

  describe '.update' do
    it 'should send updation request' do
      params[:id] = 'rule_9bcb7c733e0242439575a299'
      allow(Eligible).to receive(:request).with(:put, '/rules/rule_9bcb7c733e0242439575a299', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::V1_0::Rule.update(params, api_key: api_key)).to eq 'success'
    end

    it 'should raise error if charge id is not present' do
      expect { Eligible::V1_0::Rule.update(params, api_key: api_key) }.to raise_error(ArgumentError)
    end
  end

  describe '.delete' do
    it 'should send deletion request' do
      params[:id] = 'rule_9bcb7c733e0242439575a299'
      allow(Eligible).to receive(:request).with(:delete, '/rules/rule_9bcb7c733e0242439575a299', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::V1_0::Rule.delete(params, api_key: api_key)).to eq 'success'
    end
  end

  describe '.validate' do
    it 'should send validation request' do
      allow(Eligible).to receive(:request).with(:post, '/rules/validate', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::V1_0::Rule.validate(params, api_key: api_key)).to eq 'success'
    end
  end
end
