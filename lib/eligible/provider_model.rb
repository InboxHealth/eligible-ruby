module Eligible
  class ProviderModel < APIResource
    def self.get(params, opts = {})
      send_request(:get, '/provider_models.json', opts[:api_key], params, Util.eligible_account_headers(opts))
    end
  end
end
