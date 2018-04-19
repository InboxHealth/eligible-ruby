module Eligible
  class ProviderDetail < APIResource
    def self.get(params, api_key = nil)
      send_request(:get, '/provider_details.json', api_key, params)
    end
  end
end
