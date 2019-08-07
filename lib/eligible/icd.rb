module Eligible
  class Icd < APIResource

    def self.list(params, api_key = nil)
      send_request(:get, "/icds/#{Util.value(params, :type)}", api_key, params)
    end

    def self.describe(params, api_key = nil)
      send_request(:get, "/icds/#{Util.value(params, :type)}/describe/#{Util.value(params, :code)}", api_key, params)
    end

    def self.crosswalk(params, api_key = nil)
      send_request(:get, "/icds/#{Util.value(params, :type)}/crosswalk/#{Util.value(params, :code)}", api_key, params)
    end
  end
end
