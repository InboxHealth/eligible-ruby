describe 'Eligible::FileObject' do
  let(:params) { { test: true, rest_api_version: '1.0' } }
  let(:api_key) { 'xyz' }
  let(:response) { { success: true } }
  before(:each) do
    allow(Eligible::Util).to receive(:convert_to_eligible_object).with(response, api_key).and_return('success')
  end

  describe '.get' do
    it 'should call Eligible.request with proper url' do
      params[:file_id] = 'file_123'
      allow(Eligible).to receive(:request).with(:get, '/files/file_123.json', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::FileObject.get(params, api_key: api_key)).to eq 'success'
    end

    it 'should raise error if customer id is not present' do
      expect { Eligible::FileObject.get(params, api_key: api_key) }.to raise_error(ArgumentError)
    end
  end

  describe '.post' do
    it 'should post to Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:post, '/files.json', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::FileObject.post(params, api_key: api_key)).to eq 'success'
    end
  end

  describe '.list' do
    it 'should call Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:get, '/files.json', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::FileObject.list(params, api_key: api_key)).to eq 'success'
    end
  end
end
