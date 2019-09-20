module Eligible
  class Coverage < CoverageResource
    def self.get_uri
      return '/coverage/all.json'
    end

    def self.post_uri
      return '/coverage/all/batch.json'
    end

    def self.cost_estimate(params, opts = {})
      send_request(:get, '/coverage/cost_estimates.json', opts[:api_key], params, Util.eligible_account_headers(opts))
    end

    def self.batch_medicare_post(params, opts = {})
      send_request(:post, '/medicare/coverage/batch.json', opts[:api_key], params, Util.eligible_account_headers(opts))
    end
  end
end
