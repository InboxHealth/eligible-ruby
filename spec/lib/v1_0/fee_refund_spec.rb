describe 'Eligible::V1_0::FeeRefund' do
  let(:params) { { rest_api_version: '1.0', fee: 'fee_123' } }
  let(:api_key) { 'xyz' }
  let(:response) { { success: true } }
  before(:each) do
    allow(Eligible::Util).to receive(:convert_to_eligible_object).with(response, api_key).and_return('success')
    allow(Eligible::V1_0::FeeRefund).to receive(:fee_url).with(params).and_return('/fees/fee_123')
  end

  describe '.retrieve' do
    it 'should call Eligible.request with proper url' do
      params[:id] = 'fr_123'
      allow(Eligible::V1_0::FeeRefund).to receive(:fee_refund_id).with(params).and_return('fr_123')
      allow(Eligible).to receive(:request).with(:get, '/fees/fee_123/fee_refunds/fr_123', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::V1_0::FeeRefund.retrieve(params, api_key: api_key)).to eq 'success'
    end

    it 'should raise error if fee_refund object id is not present' do
      allow(Eligible::V1_0::FeeRefund).to receive(:fee_refund_id).with(params).and_return(nil)
      expect { Eligible::V1_0::FeeRefund.retrieve(params, api_key: api_key) }.to raise_error(ArgumentError)
    end

    it 'should raise error if fee object id is not present' do
      params[:id] = 'fr_123'
      params[:fee] = nil
      allow(Eligible::V1_0::FeeRefund).to receive(:fee_refund_id).with(params).and_return('fr_123')
      expect { Eligible::V1_0::FeeRefund.retrieve(params, api_key: api_key) }.to raise_error(ArgumentError)
    end
  end

  describe '.create' do
    it 'should call Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:post, '/fees/fee_123/fee_refunds', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::V1_0::FeeRefund.create(params, api_key: api_key)).to eq 'success'
    end
  end

  describe '.list' do
    it 'should call Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:get, '/fees/fee_123/fee_refunds', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::V1_0::FeeRefund.list(params, api_key: api_key)).to eq 'success'
    end
  end

  describe '.update' do
    it 'should call Eligible.request with proper url' do
      params[:id] = 'fr_123'
      allow(Eligible::V1_0::FeeRefund).to receive(:fee_refund_id).with(params).and_return('fr_123')
      allow(Eligible).to receive(:request).with(:put, '/fees/fee_123/fee_refunds/fr_123', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::V1_0::FeeRefund.update(params, api_key: api_key)).to eq 'success'
    end
  end

  describe '.delete' do
    it 'should raises an exception saying not supported action' do
      expect { Eligible::V1_0::FeeRefund.delete(params, api_key: api_key) }.to raise_error("Not an allowed operation for this endpoint")
    end
  end
end
