module Eligible
  class CalculatorDeployUrl < APIResource
    def self.fetch_or_create(params, opts = {})
      send_request(:get, '/calculator_deploy_urls.json', opts[:api_key], params, Util.eligible_account_headers(opts))
    end
  end
end
