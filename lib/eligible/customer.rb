module Eligible
  class Customer < APIResource
    def self.get(params, opts = {})
      send_request(:get, api_url('customers', params, :customer_id), opts[:api_key], params, Util.eligible_account_headers(opts), :customer_id)
    end

    def self.post(params, opts = {})
      send_request(:post, api_url('customers'), opts[:api_key], params, Util.eligible_account_headers(opts))
    end

    def self.update(params, opts = {})
      send_request(:put, api_url('customers', params, :customer_id), opts[:api_key], params, Util.eligible_account_headers(opts), :customer_id)
    end

    def self.all(params, opts = {})
      send_request(:get, api_url('customers'), opts[:api_key], params, Util.eligible_account_headers(opts))
    end
  end
end
