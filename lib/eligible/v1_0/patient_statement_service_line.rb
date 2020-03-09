# frozen_string_literal: true

module Eligible
  class PatientStatementServiceLine < APIResource
    REST_API_VERSION = '1.0'.freeze

    def self.get(params, opts = {})
      send_request :get, api_url('patient_statement_service_lines', params, :patient_statement_service_line_id), params, opts.merge(required_params: [:patient_statement_service_line_id])
    end

    def self.post(params, opts = {})
      send_request :post, api_url('patient_statement_service_lines'), params, opts
    end

    def self.list(params, opts = {})
      send_request :get, api_url('patient_statement_service_lines'), params, opts
    end
  end
end
