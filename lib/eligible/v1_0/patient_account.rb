# frozen_string_literal: true

module Eligible
  class PatientAccount < RestAPIBase
    ENDPOINT_NAME = 'patient_accounts'.freeze

    def self.list(_params, _opts = {})
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
