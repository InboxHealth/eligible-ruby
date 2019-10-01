describe 'Ocr' do
  let(:params) { { test: true } }
  let(:api_key) { 'xyz' }
  let(:response) { { success: true } }

  describe '.post' do
    it 'should post to Eligible.request with proper url' do
      allow(Eligible::Util).to receive(:convert_to_eligible_object).with(response, api_key).and_return('success')
      allow(Eligible).to receive(:request).with(:post, '/card_scans.json', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::Ocr.post(params, api_key: api_key)).to eq 'success'
    end

    it 'should post to Eligible.request with proper url using session token' do
      allow(Eligible::Util).to receive(:convert_to_eligible_object).with(response, nil).and_return('success')
      session_token_params = params.dup.merge(session_token: 'xyz')
      allow(Eligible).to receive(:request).with(:post, '/card_scans.json', nil, session_token_params, {}).and_return([response, nil])
      expect(Eligible::Ocr.post(session_token_params)).to eq 'success'
    end
  end
end
