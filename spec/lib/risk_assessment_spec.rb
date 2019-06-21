describe 'RiskAssessment' do
  let(:params) { { test: true } }
  let(:api_key) { 'xyz' }
  let(:response) { { success: true } }
  before(:each) do
    allow(Eligible::Util).to receive(:convert_to_eligible_object).with(response, api_key).and_return('success')
  end

  describe '.criteria' do
    it 'should call Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:get, '/risk_assessments/criteria.json', api_key, params).and_return([response, api_key])
      expect(Eligible::RiskAssessment.criteria(params, api_key)).to eq 'success'
    end
  end

  describe '.cost_estimate' do
    it 'should call Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:get, '/risk_assessments/cost_estimates.json', api_key, params).and_return([response, api_key])
      expect(Eligible::RiskAssessment.cost_estimate(params, api_key)).to eq 'success'
    end
  end

  describe '.fetch' do
    it 'should call Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:get, '/risk_assessments/fetch.json', api_key, params).and_return([response, api_key])
      expect(Eligible::RiskAssessment.fetch(params, api_key)).to eq 'success'
    end
  end
end
