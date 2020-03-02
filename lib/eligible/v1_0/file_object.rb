# frozen_string_literal: true

module Eligible
  class FileObject < APIResource
    REST_API_VERSION = '1.0'.freeze

    def self.get(params, opts = {})
      send_request :get, api_url('files', params, :file_id), params, opts.merge(required_params: [:file_id])
    end

    def self.post(params, opts = {})
      send_request :post, api_url('files'), params, opts
    end

    def self.list(params, opts = {})
      send_request :get, api_url('files'), params, opts
    end
  end
end
