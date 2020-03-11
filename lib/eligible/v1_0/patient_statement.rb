# frozen_string_literal: true

module Eligible
  class PatientStatement < APIResource
    REST_API_VERSION = '1.0'.freeze

    def self.get(params, opts = {})
      send_request :get, api_url('patient_statements', params, :patient_statement_id), params, opts.merge(required_params: [:patient_statement_id])
    end

    def self.post(params, opts = {})
      send_request :post, api_url('patient_statements'), params, opts
    end

    def self.update(params, opts = {})
      send_request :put, api_url('patient_statements', params, :patient_statement_id), params, opts.merge(required_params: [:patient_statement_id])
    end

    def self.list(params, opts = {})
      send_request :get, api_url('patient_statements'), params, opts
    end

    # Finalize the patient statement
    def self.finalize(params, opts = {})
      send_request :post, "/patient_statements/#{statement_id(params)}/finalize", params, opts.merge(required_params: [:patient_statement_id])
    end

    # Post a payment
    def self.payment(params, opts = {})
      send_request :post, "/patient_statements/#{statement_id(params)}/payment", params, opts.merge(required_params: [:patient_statement_id])
    end

    # List all payments
    def self.payments(params, opts = {})
      send_request :get, "/patient_statements/#{statement_id(params)}/payments", params, opts.merge(required_params: [:patient_statement_id])
    end

    # Capture a Patient Statement
    def self.capture(params, opts = {})
      send_request :post, "/patient_statements/#{statement_id(params)}/capture", params, opts.merge(required_params: [:patient_statement_id])
    end

    # Process a Patient Statement
    def self.process(params, opts = {})
      send_request :post, "/patient_statements/#{statement_id(params)}/process", params, opts.merge(required_params: [:patient_statement_id])
    end

    # Send a Patient Statement
    def self.send(params, opts = {})
      send_request :post, "/patient_statements/#{statement_id(params)}/send", params, opts.merge(required_params: [:patient_statement_id])
    end

    # Void a Patient Statement
    def self.void(params, opts = {})
      send_request :post, "/patient_statements/#{statement_id(params)}/void", params, opts.merge(required_params: [:patient_statement_id])
    end

    # Mark UnCollectible
    def self.mark_uncollectible(params, opts = {})
      send_request :post, "/patient_statements/#{statement_id(params)}/mark_uncollectible", params, opts.merge(required_params: [:patient_statement_id])
    end

    # Reestimate a Patient Statement
    def self.reestimate(params, opts = {})
      send_request :post, "/patient_statements/#{statement_id(params)}/reestimate", params, opts.merge(required_params: [:patient_statement_id])
    end

    private

    def statement_id(params)
      Util.value(params, :patient_statement_id)
    end
  end
end
