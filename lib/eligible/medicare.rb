module Eligible
  class Medicare < APIResource

    class << self

      def get(params, api_key=nil)
        response, api_key = Eligible.request(:get, url, api_key, params)
        Util.convert_to_eligible_object(response, api_key)
      end


      def batch_post(params, api_key=nil)
        response, api_key = Eligible.request(:post, '/medicare/coverage/batch.json', api_key, params)
        Util.convert_to_eligible_object(response, api_key)
      end

      def url()
        '/medicare/coverage.json'
      end

    end

  end
end