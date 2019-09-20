module Eligible
  class Payer < APIResource
    def self.list(params, opts = {})
      send_request(:get, api_url('payers'), opts[:api_key], params, Util.eligible_account_headers(opts))
    end

    def self.get(params, opts = {})
      send_request(:get, api_url('payers', params, :payer_id), opts[:api_key], params, Util.eligible_account_headers(opts), :payer_id)
    end

    def self.search_options(params, opts = {})
      payer_id = Util.value(params, :payer_id)
      url = payer_id.nil? ? '/payers/search_options' : "/payers/#{payer_id}/search_options"
      send_request(:get, url, opts[:api_key], params, Util.eligible_account_headers(opts))
    end
  end
end
