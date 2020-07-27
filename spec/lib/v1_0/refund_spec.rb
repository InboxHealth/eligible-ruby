describe 'Eligible::V1_0::Refund' do
  let(:params) { { rest_api_version: '1.0' } }
  let(:api_key) { 'xyz' }
  let(:response) { { success: true } }
  before(:each) do
    allow(Eligible::Util).to receive(:convert_to_eligible_object).with(response, api_key).and_return('success')
  end

  describe '.retrieve' do
    it 'should call Eligible.request with proper url' do
      params[:id] = 'ref_9bcb7c733e0242439575a299'
      allow(Eligible).to receive(:request).with(:get, '/refunds/ref_9bcb7c733e0242439575a299', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::V1_0::Refund.retrieve(params[:id], api_key: api_key)).to eq 'success'
    end

    it 'should raise error if refund id is not present' do
      expect { Eligible::V1_0::Refund.retrieve(nil, api_key: api_key) }.to raise_error(ArgumentError)
    end
  end

  describe '.list' do
    it 'should call Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:get, '/refunds', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::V1_0::Refund.list(params, api_key: api_key)).to eq 'success'
    end
  end

  describe '.create' do
    it 'should raises an exception saying not supported action' do
      expect { Eligible::V1_0::Refund.create(params, api_key: api_key) }.to raise_error("Not an allowed operation for this endpoint")
    end
  end

  describe '.update' do
    it 'should raises an exception saying not supported action' do
      expect { Eligible::V1_0::Refund.update(params, api_key: api_key) }.to raise_error("Not an allowed operation for this endpoint")
    end
  end

  describe '.delete' do
    it 'should raises an exception saying not supported action' do
      expect { Eligible::V1_0::Refund.delete(params, api_key: api_key) }.to raise_error("Not an allowed operation for this endpoint")
    end
  end
end
