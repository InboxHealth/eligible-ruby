module Eligible
  class Payment < APIResource
    def self.get(params, opts = {})
      send_request(:get, '/payment/status.json', opts[:api_key], params, Util.eligible_account_headers(opts))
    end

    def self.batch(params, opts = {})
      send_request(:get, '/batch/payment/status.json', opts[:api_key], params, Util.eligible_account_headers(opts))
    end
  end
end
