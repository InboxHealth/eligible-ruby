# frozen_string_literal: true

module Eligible
  class PayerMapping < APIResource
    def self.mapper(params, opts = {})
      send_request(:post, '/payer_mapping/mapper', opts[:api_key], params, Util.eligible_account_headers(opts))
    end

    def self.mapper_batch(params, opts = {})
      send_request(:post, '/payer_mapping/mapper/batch', opts[:api_key], params, Util.eligible_account_headers(opts))
    end

    def self.search(params, opts = {})
      send_request(:post, '/payer_mapping/search', opts[:api_key], params, Util.eligible_account_headers(opts))
    end

    def self.search_batch(params, opts = {})
      send_request(:post, '/payer_mapping/search/batch', opts[:api_key], params, Util.eligible_account_headers(opts))
    end

    def self.normalize(params, opts = {})
      send_request(:post, '/payer_mapping/normalize', opts[:api_key], params, Util.eligible_account_headers(opts))
    end

    def self.normalize_batch(params, opts = {})
      send_request(:post, '/payer_mapping/normalize/batch', opts[:api_key], params, Util.eligible_account_headers(opts))
    end

    def self.normalize_cased(params, opts = {})
      send_request(:post, '/payer_mapping/normalize_cased', opts[:api_key], params, Util.eligible_account_headers(opts))
    end

    def self.normalize_cased_batch(params, opts = {})
      send_request(:post, '/payer_mapping/normalize_cased/batch', opts[:api_key], params, Util.eligible_account_headers(opts))
    end
  end
end
