# frozen_string_literal: true

module Eligible
  class PatientStatementServiceLine < RestAPIBase
    ENDPOINT_NAME = 'patient_statement_service_lines'.freeze

    # not an allowed operation so override the implementation to not support explicitly even though route is not defined
    def self.update; end
  end
end
