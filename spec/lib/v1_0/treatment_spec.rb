describe 'Eligible::Treatment' do
  let(:params) { { rest_api_version: '1.0' } }
  let(:api_key) { 'xyz' }
  let(:response) { { success: true } }
  before(:each) do
    allow(Eligible::Util).to receive(:convert_to_eligible_object).with(response, api_key).and_return('success')
    allow(Eligible::Treatment).to receive(:endpoint_name).and_return('treatments')
  end

  describe '.retrieve' do
    it 'should call Eligible.request with proper url' do
      params[:id] = 'trt_9bcb7c733e0242439575a299'
      allow(Eligible).to receive(:request).with(:get, '/treatments/trt_9bcb7c733e0242439575a299', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::Treatment.retrieve(params[:id], api_key: api_key)).to eq 'success'
    end

    it 'should raise error if product id is not present' do
      expect { Eligible::Treatment.retrieve(nil, api_key: api_key) }.to raise_error(ArgumentError)
    end
  end

  describe '.create' do
    it 'should post to Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:post, '/treatments', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::Treatment.create(params, api_key: api_key)).to eq 'success'
    end
  end

  describe '.list' do
    it 'should call Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:get, '/treatments', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::Treatment.list(params, api_key: api_key)).to eq 'success'
    end
  end

  describe '.update' do
    it 'should call Eligible.request with proper url' do
      params[:id] = 'trt_9bcb7c733e0242439575a299'
      allow(Eligible).to receive(:request).with(:put, '/treatments/trt_9bcb7c733e0242439575a299', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::Treatment.update(params, api_key: api_key)).to eq 'success'
    end

    it 'should raise error if product id is not present' do
      expect { Eligible::Treatment.update(params, api_key: api_key) }.to raise_error(ArgumentError)
    end
  end
end
