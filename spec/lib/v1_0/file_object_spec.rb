describe 'Eligible::V1_0::FileObject' do
  let(:params) { { rest_api_version: '1.0' } }
  let(:api_key) { 'xyz' }
  let(:response) { { success: true } }
  before(:each) do
    allow(Eligible::Util).to receive(:convert_to_eligible_object).with(response, api_key).and_return('success')
    allow(Eligible::V1_0::FileObject).to receive(:endpoint_name).and_return('files')
  end

  describe '.retrieve' do
    it 'should call Eligible.request with proper url' do
      params[:id] = 'file_123'
      allow(Eligible).to receive(:request).with(:get, '/files/file_123', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::V1_0::FileObject.retrieve(params[:id], api_key: api_key)).to eq 'success'
    end

    it 'should raise error if file object id is not present' do
      expect { Eligible::V1_0::FileObject.retrieve(nil, api_key: api_key) }.to raise_error(ArgumentError)
    end
  end

  describe '.create' do
    it 'should post to Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:post, '/files', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::V1_0::FileObject.create(params, api_key: api_key)).to eq 'success'
    end
  end

  describe '.list' do
    it 'should call Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:get, '/files', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::V1_0::FileObject.list(params, api_key: api_key)).to eq 'success'
    end
  end
end
