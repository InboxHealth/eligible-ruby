module Eligible
  class ProviderModel < APIResource
    def self.get(params, api_key = nil)
      send_request(:get, '/provider_models.json', api_key, params)
    end
  end
end
