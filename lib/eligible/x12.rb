module Eligible
  class X12 < APIResource
    def self.post(params, opts = {})
      params[:format] = 'x12'
      send_request(:post, '/x12', opts[:api_key], params, Util.eligible_account_headers(opts))
    end
  end
end
