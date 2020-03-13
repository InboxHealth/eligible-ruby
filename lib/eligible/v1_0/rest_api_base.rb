# frozen_string_literal: true

module Eligible
  class RestAPIBase < APIResource
    REST_API_VERSION = '1.0'.freeze

    def self.retrieve(id, opts = {})
      send_request :get, api_url(endpoint_name, rest_api_params(id), :id), rest_api_params(id), opts.merge(required_params: [:id])
    end

    def self.create(params, opts = {})
      send_request :post, api_url(endpoint_name), rest_api_params(params), opts
    end

    def self.update(params, opts = {})
      send_request :put, api_url(endpoint_name, rest_api_params(params), :id), rest_api_params(params), opts.merge(required_params: [:id])
    end

    def self.list(params, opts = {})
      send_request :get, api_url(endpoint_name), rest_api_params(params), opts
    end

    private

    def self.endpoint_name
      self.const_get('ENDPOINT_NAME')
    end
  end
end
