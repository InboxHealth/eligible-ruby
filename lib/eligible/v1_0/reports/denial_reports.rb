# frozen_string_literal: true

module Eligible
  module V1_0
    module Reports
      class DenialReports < RestAPIBase
        ENDPOINT_NAME = 'reports/denial_reports'.freeze

        def self.create(_params, _opts = {})
          fail NotImplementedError, "Not an allowed operation for this endpoint"
        end

        def self.update(_params, _opts = {})
          fail NotImplementedError, "Not an allowed operation for this endpoint"
        end

        def self.delete(_params, _opts = {})
          fail NotImplementedError, "Not an allowed operation for this endpoint"
        end
      end
    end
  end
end
