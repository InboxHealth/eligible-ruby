# frozen_string_literal: true

module Eligible
  class InsuranceCompany < RestAPIBase
    ENDPOINT_NAME = 'insurance_companies'.freeze

    # not an allowed operation so override the implementation to not support explicitly even though route is not defined
    def self.create; end

    # not an allowed operation so override the implementation to not support explicitly even though route is not defined
    def self.update; end
  end
end
