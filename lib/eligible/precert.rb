module Eligible
  class Precert < PreauthResource
    def self.require(params, opts = {})
      send_request(:get, '/precert/require.json', opts[:api_key], params, Util.eligible_account_headers(opts))
    end

    def self.get_uri
      return '/precert/inquiry.json'
    end

    def self.post_uri
      return '/precert/create.json'
    end
  end
end
