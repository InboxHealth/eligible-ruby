module Eligible
  class RiskAssessment < APIResource
    def self.criteria(params, opts = {})
      send_request(:get, '/risk_assessments/criteria.json', opts[:api_key], params, Util.eligible_account_headers(opts))
    end

    def self.cost_estimate(params, opts = {})
      send_request(:get, '/risk_assessments/cost_estimates.json', opts[:api_key], params, Util.eligible_account_headers(opts))
    end

    def self.fetch(params, opts = {})
      send_request(:get, '/risk_assessments/fetch.json', opts[:api_key], params, Util.eligible_account_headers(opts))
    end
  end
end
