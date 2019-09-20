module Eligible
  class Claim < APIResource
    def self.ack(params, opts = {})
      reference_id = Util.value(params, :reference_id)
      send_request(:get, "/claims/#{reference_id}/acknowledgements.json", opts[:api_key], params, Util.eligible_account_headers(opts), :reference_id)
    end

    def self.post(params, opts = {})
      send_request(:post, '/claims.json', opts[:api_key], params, Util.eligible_account_headers(opts))
    end

    def self.acks(params, opts = {})
      send_request(:get, '/claims/acknowledgements.json', opts[:api_key], params, Util.eligible_account_headers(opts))
    end

    def self.payment_report(params, opts = {})
      reference_id = Util.value(params, :reference_id)
      require_param(reference_id, 'Reference id')
      id = Util.value(params, :id)
      url = id.nil? ? "/claims/#{reference_id}/payment_reports" : "/claims/#{reference_id}/payment_reports/#{id}"
      send_request(:get, url, opts[:api_key], params, Util.eligible_account_headers(opts))
    end

    def self.payment_reports(params, opts = {})
      send_request(:get, '/claims/payment_reports.json', opts[:api_key], params, Util.eligible_account_headers(opts))
    end
  end
end
