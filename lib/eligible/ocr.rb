module Eligible
  class Ocr < APIResource
    def self.setup_file(params)
      file = Util.value(params, :file)
      params[:file] = File.new(file, 'rb') if file.is_a?(String)
    end

    def self.post(params, api_key = nil)
      setup_file(params)
      send_request(:post, '/card_scans.json', api_key, params)
    end
  end
end
