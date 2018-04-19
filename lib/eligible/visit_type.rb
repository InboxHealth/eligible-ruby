module Eligible
  class VisitType < APIResource
    def self.list(params, api_key = nil)
      send_request(:get, '/visit_types.json', api_key, params)
    end

    def self.insurance_company_ids(params, api_key = nil)
      send_request(:get, '/visit_types/insurance_company_ids.json', api_key, params)
    end
  end
end
