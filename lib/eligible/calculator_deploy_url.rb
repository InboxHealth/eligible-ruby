module Eligible
  class CalculatorDeployUrl < APIResource
    def self.fetch_or_create(params, api_key = nil)
      send_request(:get, '/calculator_deploy_urls.json', api_key, params)
    end
  end
end
