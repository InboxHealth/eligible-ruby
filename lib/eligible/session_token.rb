module Eligible
  class SessionToken < APIResource
    def self.create(params, opts = {})
      send_request(:post, '/session_tokens/create.json', opts[:api_key], params, Util.eligible_account_headers(opts))
    end

    def self.revoke(params, opts = {})
      send_request(:post, '/session_tokens/revoke.json', opts[:api_key], params, Util.eligible_account_headers(opts))
    end
  end
end
