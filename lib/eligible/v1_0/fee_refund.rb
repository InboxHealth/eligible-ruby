# frozen_string_literal: true

module Eligible
  module V1_0
    class FeeRefund < RestAPIBase
      ENDPOINT_NAME = 'fee_refunds'.freeze

      def self.retrieve(params, opts = {})
        send_request :get, "#{fee_url(params)}/fee_refunds/#{fee_refund_id(params)}", rest_api_params(params), opts.merge(required_params: [:id, :fee])
      end

      def self.create(params, opts = {})
        send_request :post, "#{fee_url(params)}/fee_refunds", rest_api_params(params), opts.merge(required_params: [:fee])
      end

      def self.update(params, opts = {})
        send_request :put, "#{fee_url(params)}/fee_refunds/#{fee_refund_id(params)}", rest_api_params(params), opts.merge(required_params: [:id, :fee])
      end

      def self.list(params, opts = {})
        send_request :get, "#{fee_url(params)}/fee_refunds", rest_api_params(params), opts.merge(required_params: [:fee])
      end

      def self.delete(_params, _opts = {})
        fail NotImplementedError, "Not an allowed operation for this endpoint"
      end
    end

    def self.fee_refund_id(params)
      Util.value(rest_api_params(params), :id)
    end

    def self.fee_url(params)
      fee_id = Util.value(rest_api_params(params), :fee)
      "/fees/#{fee_id}"
    end
  end
end
