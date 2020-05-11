# frozen_string_literal: true

module Eligible
  module V1_0
    class Enrollment < RestAPIBase
      ENDPOINT_NAME = 'enrollments'.freeze

      def self.summary(params, opts = {})
        send_request :get, "/#{ENDPOINT_NAME}/summary", rest_api_params(params), opts
      end
    end
  end
end
