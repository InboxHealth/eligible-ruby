module Eligible
  class ReceivedPdf < APIResource
    def self.received_pdf_url(params)
      enrollment_npi_id = Util.value(params, :enrollment_npi_id)
      "/enrollment_npis/#{enrollment_npi_id}/received_pdf"
    end

    def self.get(params, opts = {})
      send_request(:get, received_pdf_url(params), opts[:api_key], params, Util.eligible_account_headers(opts), :enrollment_npi_id)
    end

    def self.download(params, opts = {})
      enrollment_npi_id = Util.value(params, :enrollment_npi_id)
      require_param(enrollment_npi_id, 'Enrollment Npi id')
      params[:format] = 'x12'
      response = Eligible.request(:get, "/enrollment_npis/#{params[:enrollment_npi_id]}/received_pdf/download", opts[:api_key], params, Util.eligible_account_headers(opts))[0]
      filename = params[:filename] || '/tmp/received_pdf.pdf'
      file = File.new(filename, 'w')
      file.write response
      file.close
      "PDF file stored at #{filename}"
    end
  end
end
