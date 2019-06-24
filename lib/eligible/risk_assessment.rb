module Eligible
  class RiskAssessment < APIResource
    def self.criteria(params, api_key = nil)
      send_request(:get, '/risk_assessments/criteria.json', api_key, params)
    end

    def self.cost_estimate(params, api_key = nil)
      send_request(:get, '/risk_assessments/cost_estimates.json', api_key, params)
    end

    def self.fetch(params, api_key = nil)
      send_request(:get, '/risk_assessments/fetch.json', api_key, params)
    end
  end
end
