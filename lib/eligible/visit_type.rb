module Eligible
  class VisitType < APIResource
    def self.list(params, opts = {})
      send_request(:get, '/visit_types.json', opts[:api_key], params, Util.eligible_account_headers(opts))
    end

    def self.insurance_company_ids(params, opts = {})
      send_request(:get, '/visit_types/insurance_company_ids.json', opts[:api_key], params, Util.eligible_account_headers(opts))
    end
  end
end
