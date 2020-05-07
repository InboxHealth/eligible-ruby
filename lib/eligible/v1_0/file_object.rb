# frozen_string_literal: true

module Eligible
  module V1_0
    class FileObject < RestAPIBase
      ENDPOINT_NAME = 'files'.freeze

      # not an allowed operation so override the implementation to not support explicitly even though route is not defined
      def self.update; end
    end
  end
end
