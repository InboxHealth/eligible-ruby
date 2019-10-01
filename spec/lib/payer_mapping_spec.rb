describe 'Eligible::PayerMapping' do
  let(:params) { { test: true } }
  let(:api_key) { 'xyz' }
  let(:response) { { success: true } }
  before(:each) do
    allow(Eligible::Util).to receive(:convert_to_eligible_object).with(response, api_key).and_return('success')
  end

  describe '.mapper' do
    it 'should post to Eligible.request with proper url and headers' do
      allow(Eligible).to receive(:request).with(:post, '/payer_mapping/mapper', api_key, params, { eligible_account: 'xyz' }).and_return([response, api_key])
      expect(Eligible::PayerMapping.mapper(params, api_key: api_key, eligible_account: 'xyz', xyz: '123')).to eq 'success'
    end

    it 'should post to Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:post, '/payer_mapping/mapper', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::PayerMapping.mapper(params, api_key: api_key)).to eq 'success'
    end
  end

  describe '.mapper_batch' do
    it 'should post to Eligible.request with proper url and headers' do
      allow(Eligible).to receive(:request).with(:post, '/payer_mapping/mapper/batch', api_key, params, { eligible_account: 'xyz' }).and_return([response, api_key])
      expect(Eligible::PayerMapping.mapper_batch(params, api_key: api_key, eligible_account: 'xyz', xyz: '123')).to eq 'success'
    end

    it 'should post to Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:post, '/payer_mapping/mapper/batch', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::PayerMapping.mapper_batch(params, api_key: api_key)).to eq 'success'
    end
  end

  describe '.search' do
    it 'should post to Eligible.request with proper url and headers' do
      allow(Eligible).to receive(:request).with(:post, '/payer_mapping/search', api_key, params, { eligible_account: 'xyz' }).and_return([response, api_key])
      expect(Eligible::PayerMapping.search(params, api_key: api_key, eligible_account: 'xyz', xyz: '123')).to eq 'success'
    end

    it 'should post to Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:post, '/payer_mapping/search', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::PayerMapping.search(params, api_key: api_key)).to eq 'success'
    end
  end

  describe '.search_batch' do
    it 'should post to Eligible.request with proper url and headers' do
      allow(Eligible).to receive(:request).with(:post, '/payer_mapping/search/batch', api_key, params, { eligible_account: 'xyz' }).and_return([response, api_key])
      expect(Eligible::PayerMapping.search_batch(params, api_key: api_key, eligible_account: 'xyz', xyz: '123')).to eq 'success'
    end

    it 'should post to Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:post, '/payer_mapping/search/batch', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::PayerMapping.search_batch(params, api_key: api_key)).to eq 'success'
    end
  end

  describe '.normalize' do
    it 'should post to Eligible.request with proper url and headers' do
      allow(Eligible).to receive(:request).with(:post, '/payer_mapping/normalize', api_key, params, { eligible_account: 'xyz' }).and_return([response, api_key])
      expect(Eligible::PayerMapping.normalize(params, api_key: api_key, eligible_account: 'xyz', xyz: '123')).to eq 'success'
    end

    it 'should post to Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:post, '/payer_mapping/normalize', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::PayerMapping.normalize(params, api_key: api_key)).to eq 'success'
    end
  end

  describe '.normalize_batch' do
    it 'should post to Eligible.request with proper url and headers' do
      allow(Eligible).to receive(:request).with(:post, '/payer_mapping/normalize/batch', api_key, params, { eligible_account: 'xyz' }).and_return([response, api_key])
      expect(Eligible::PayerMapping.normalize_batch(params, api_key: api_key, eligible_account: 'xyz', xyz: '123')).to eq 'success'
    end

    it 'should post to Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:post, '/payer_mapping/normalize/batch', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::PayerMapping.normalize_batch(params, api_key: api_key)).to eq 'success'
    end
  end

  describe '.normalize_cased' do
    it 'should post to Eligible.request with proper url and headers' do
      allow(Eligible).to receive(:request).with(:post, '/payer_mapping/normalize_cased', api_key, params, { eligible_account: 'xyz' }).and_return([response, api_key])
      expect(Eligible::PayerMapping.normalize_cased(params, api_key: api_key, eligible_account: 'xyz', xyz: '123')).to eq 'success'
    end

    it 'should post to Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:post, '/payer_mapping/normalize_cased', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::PayerMapping.normalize_cased(params, api_key: api_key)).to eq 'success'
    end
  end

  describe '.normalize_cased_batch' do
    it 'should post to Eligible.request with proper url and headers' do
      allow(Eligible).to receive(:request).with(:post, '/payer_mapping/normalize_cased/batch', api_key, params, { eligible_account: 'xyz' }).and_return([response, api_key])
      expect(Eligible::PayerMapping.normalize_cased_batch(params, api_key: api_key, eligible_account: 'xyz', xyz: '123')).to eq 'success'
    end

    it 'should post to Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:post, '/payer_mapping/normalize_cased/batch', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::PayerMapping.normalize_cased_batch(params, api_key: api_key)).to eq 'success'
    end
  end
end
