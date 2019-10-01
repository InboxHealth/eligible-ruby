module Eligible
  class APIResource < EligibleObject
    def self.class_name
      name.split('::').last
    end

    def self.api_url(base, params = nil, param_id = nil)
      if params.nil?
        "/#{base}.json"
      else
        id = Util.value(params, param_id)
        "/#{base}/#{id}.json"
      end
    end

    def self.url
      if self == APIResource
        fail NotImplementedError, 'APIResource is an abstract class.  You should perform actions on its subclasses (Plan, Service, etc.)'
      end
      "/#{CGI.escape(class_name.downcase)}/"
    end

    def self.require_param(value, name)
      fail ArgumentError, "#{name} of the #{class_name} is required" if value.nil? || (value.is_a?(String) && value.empty?)
    end

    def self.required_param_validation(params:, required_param_name:)
      return if required_param_name.nil?

      required_param = Util.value(params, required_param_name)
      require_param(required_param, required_param_name)
    end

    def self.send_request(method, url, params, opts)
      headers = opts.clone
      client_secret = headers.delete(:client_secret)
      api_key = headers.delete(:api_key)
      api_key = client_secret unless client_secret.nil?

      required_param_validation(params: params, required_param_name: headers.delete(:required_param_name))

      response, api_key = Eligible.request(method, url, api_key, params, headers)
      Util.convert_to_eligible_object(response, api_key)
    end

  end
end
