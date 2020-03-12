# frozen_string_literal: true

module Eligible
  class RestAPIBase < APIResource
    REST_API_VERSION = '1.0'.freeze

    def self.retrieve(id, opts = {})
      send_request :get, api_url(endpoint_name, rest_api_params(id: id), :id), rest_api_params(id: id), opts.merge(required_params: [:id])
    end

    def self.create(params, opts = {})
      send_request :post, api_url(endpoint_name), rest_api_params(params: params), opts
    end

    def self.update(params, opts = {})
      send_request :put, api_url(endpoint_name, params, :id), params, opts.merge(required_params: [:id])
    end

    def self.list(params, opts = {})
      send_request :get, api_url(endpoint_name), rest_api_params(params: params), opts
    end

    private

    def endpoint_name
      self.class.const_get('ENDPOINT_NAME')
    end
  end
end
