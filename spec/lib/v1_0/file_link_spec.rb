describe 'Eligible::V1_0::FileLink' do
  let(:params) { { rest_api_version: '1.0' } }
  let(:api_key) { 'xyz' }
  let(:response) { { success: true } }
  before(:each) do
    allow(Eligible::Util).to receive(:convert_to_eligible_object).with(response, api_key).and_return('success')
  end

  describe '.retrieve' do
    it 'should call Eligible.request with proper url' do
      params[:id] = 'link_123'
      allow(Eligible).to receive(:request).with(:get, '/file_links/link_123', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::V1_0::FileLink.retrieve(params[:id], api_key: api_key)).to eq 'success'
    end

    it 'should raise error if file object id is not present' do
      expect { Eligible::V1_0::FileLink.retrieve(nil, api_key: api_key) }.to raise_error(ArgumentError)
    end
  end

  describe '.create' do
    it 'should post to Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:post, '/file_links', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::V1_0::FileLink.create(params, api_key: api_key)).to eq 'success'
    end
  end

  describe '.list' do
    it 'should call Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:get, '/file_links', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::V1_0::FileLink.list(params, api_key: api_key)).to eq 'success'
    end
  end

  describe '.update' do
    it 'should call Eligible.request with proper url' do
      params[:id] = 'link_123'
      allow(Eligible).to receive(:request).with(:put, '/file_links/link_123', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::V1_0::FileLink.update(params, api_key: api_key)).to eq 'success'
    end

    it 'should raise error if discount id is not present' do
      expect { Eligible::V1_0::FileLink.update(params, api_key: api_key) }.to raise_error(ArgumentError)
    end
  end

  describe '.delete' do
    it 'should raises an exception saying not supported action' do
      expect { Eligible::V1_0::FileLink.delete(params, api_key: api_key) }.to raise_error("Not an allowed operation for this endpoint")
    end
  end
end
