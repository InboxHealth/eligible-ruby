# frozen_string_literal: true

module Eligible
  class InsuranceCompany < RestAPIBase
    ENDPOINT_NAME = 'insurance_companies'.freeze

    def self.create(_params, _opts = {})
      fail NotImplementedError, "Not an allowed operation for this endpoint"
    end

    def self.update(_params, _opts = {})
      fail NotImplementedError, "Not an allowed operation for this endpoint"
    end
  end
end