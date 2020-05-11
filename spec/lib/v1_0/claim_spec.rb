describe 'Eligible::V1_0::Claim' do
  let(:params) { { rest_api_version: '1.0' } }
  let(:api_key) { 'xyz' }
  let(:response) { { success: true } }
  before(:each) do
    allow(Eligible::Util).to receive(:convert_to_eligible_object).with(response, api_key).and_return('success')
  end

  describe '.retrieve' do
    it 'should call Eligible.request with proper url' do
      params[:id] = 'cla_9bcb7c733e0242439575a299'
      allow(Eligible).to receive(:request).with(:get, '/claims/cla_9bcb7c733e0242439575a299', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::V1_0::Claim.retrieve(params[:id], api_key: api_key)).to eq 'success'
    end

    it 'should raise error if claim id is not present' do
      expect { Eligible::V1_0::Claim.retrieve(nil, api_key: api_key) }.to raise_error(ArgumentError)
    end
  end

  describe '.create' do
    it 'should post to Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:post, '/claims', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::V1_0::Claim.create(params, api_key: api_key)).to eq 'success'
    end
  end

  describe '.list' do
    it 'should call Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:get, '/claims', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::V1_0::Claim.list(params, api_key: api_key)).to eq 'success'
    end
  end

  describe '.update' do
    it 'should call Eligible.request with proper url' do
      params[:id] = 'cla_9bcb7c733e0242439575a299'
      allow(Eligible).to receive(:request).with(:put, '/claims/cla_9bcb7c733e0242439575a299', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::V1_0::Claim.update(params, api_key: api_key)).to eq 'success'
    end

    it 'should raise error if claim id is not present' do
      expect { Eligible::V1_0::Claim.update(params, api_key: api_key) }.to raise_error(ArgumentError)
    end
  end

  describe "claim events" do
    context '.submit' do
      it 'should call Eligible.request with proper url' do
        params[:id] = 'cla_9bcb7c733e0242439575a299'
        allow(Eligible).to receive(:request).with(:post, '/claims/cla_9bcb7c733e0242439575a299/submit', api_key, params, {}).and_return([response, api_key])
        expect(Eligible::V1_0::Claim.submit(params[:id], api_key: api_key)).to eq 'success'
      end

      it 'should raise error if claim id is not present' do
        expect { Eligible::V1_0::Claim.submit(nil, api_key: api_key) }.to raise_error(ArgumentError)
      end
    end

    context '.correct' do
      it 'should call Eligible.request with proper url' do
        params[:id] = 'cla_9bcb7c733e0242439575a299'
        allow(Eligible).to receive(:request).with(:post, '/claims/cla_9bcb7c733e0242439575a299/correct', api_key, params, {}).and_return([response, api_key])
        expect(Eligible::V1_0::Claim.correct(params[:id], api_key: api_key)).to eq 'success'
      end

      it 'should raise error if claim id is not present' do
        expect { Eligible::V1_0::Claim.correct(nil, api_key: api_key) }.to raise_error(ArgumentError)
      end
    end

    context '.cancel' do
      it 'should call Eligible.request with proper url' do
        params[:id] = 'cla_9bcb7c733e0242439575a299'
        allow(Eligible).to receive(:request).with(:delete, '/claims/cla_9bcb7c733e0242439575a299/cancel', api_key, params, {}).and_return([response, api_key])
        expect(Eligible::V1_0::Claim.cancel(params[:id], api_key: api_key)).to eq 'success'
      end

      it 'should raise error if claim id is not present' do
        expect { Eligible::V1_0::Claim.cancel(nil, api_key: api_key) }.to raise_error(ArgumentError)
      end
    end
  end
end
