module Eligible
  class OauthToken < APIResource
    def self.post(params, opts = {})
      send_request(:post, '/oauth/token', opts[:api_key], params, Util.eligible_account_headers(opts))
    end
  end
end
