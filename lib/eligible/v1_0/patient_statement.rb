# frozen_string_literal: true

module Eligible
  module V1_0
    class PatientStatement < RestAPIBase
      ENDPOINT_NAME = 'patient_statements'.freeze

      # Finalize the patient statement
      def self.finalize(id, opts = {})
        send_request :post, "/#{endpoint_name}/#{object_key(id)}/finalize", rest_api_params(id), opts.merge(required_params: [:id])
      end

      # Post a payment
      def self.pay(params, opts = {})
        send_request :post, "/#{endpoint_name}/#{object_key(params)}/payment_reports", rest_api_params(params), opts.merge(required_params: [:id])
      end

      # List all payments
      def self.payments(params, opts = {})
        send_request :get, "/#{endpoint_name}/#{object_key(params)}/payment_reports", rest_api_params(params), opts.merge(required_params: [:id])
      end

      # Capture a Patient Statement
      def self.capture(params, opts = {})
        send_request :post, "/#{endpoint_name}/#{object_key(params)}/capture", rest_api_params(params), opts.merge(required_params: [:id])
      end

      # Process a Patient Statement
      def self.process(params, opts = {})
        send_request :post, "/#{endpoint_name}/#{object_key(params)}/process", rest_api_params(params), opts.merge(required_params: [:id])
      end

      # Send a Patient Statement
      def self.send(id, opts = {})
        send_request :post, "/#{endpoint_name}/#{object_key(id)}/send", rest_api_params(id), opts.merge(required_params: [:id])
      end

      # Void a Patient Statement
      def self.void(id, opts = {})
        send_request :post, "/#{endpoint_name}/#{object_key(id)}/void", rest_api_params(id), opts.merge(required_params: [:id])
      end

      # Mark UnCollectible
      def self.mark_uncollectible(id, opts = {})
        send_request :post, "/#{endpoint_name}/#{object_key(id)}/mark_uncollectible", rest_api_params(id), opts.merge(required_params: [:id])
      end

      # Reestimate a Patient Statement
      def self.reestimate(params, opts = {})
        send_request :post, "/#{endpoint_name}/#{object_key(params)}/reestimate", rest_api_params(params), opts.merge(required_params: [:id])
      end

      # Submit a claim for a patient statement
      def self.submit_claim(params, opts = {})
        send_request :post, "/#{endpoint_name}/#{object_key(params)}/submit_claim", rest_api_params(params), opts.merge(required_params: [:id])
      end
    end
  end
end
