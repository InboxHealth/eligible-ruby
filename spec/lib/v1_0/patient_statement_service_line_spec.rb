describe 'Eligible::PatientStatementServiceLine' do
  let(:params) { { test: true, rest_api_version: '1.0' } }
  let(:api_key) { 'xyz' }
  let(:response) { { success: true } }
  before(:each) do
    allow(Eligible::Util).to receive(:convert_to_eligible_object).with(response, api_key).and_return('success')
  end

  describe '.get' do
    it 'should call Eligible.request with proper url' do
      params[:patient_statement_service_line_id] = 'psl_8e1856b5cf0d459580be4075'
      allow(Eligible).to receive(:request).with(:get, '/patient_statement_service_lines/psl_8e1856b5cf0d459580be4075', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::PatientStatementServiceLine.get(params, api_key: api_key)).to eq 'success'
    end

    it 'should raise error if patient_statement id is not present' do
      expect { Eligible::PatientStatementServiceLine.get(params, api_key: api_key) }.to raise_error(ArgumentError)
    end
  end

  describe '.post' do
    it 'should post to Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:post, '/patient_statement_service_lines', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::PatientStatementServiceLine.post(params, api_key: api_key)).to eq 'success'
    end
  end

  describe '.list' do
    it 'should call Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:get, '/patient_statement_service_lines', api_key, params, {}).and_return([response, api_key])
      expect(Eligible::PatientStatementServiceLine.list(params, api_key: api_key)).to eq 'success'
    end
  end
end
