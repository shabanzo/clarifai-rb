# frozen_string_literal: true

require "open-uri"

module Clarifai
  class Predict
    SUPPORTED_TYPES = %w[image video text].freeze

    def initialize(model_id:)
      @model_id = model_id
    end

    def call(type:, urls:)
      raise "Type is not supported! (#{SUPPORTED_TYPES.join(', ')} only)" unless SUPPORTED_TYPES.include?(type)
      raise 'Input data not supported! (Array of Strings or String only)' unless valid_params?(urls)

      http = setup_http_client
      request = setup_predict_request(type, urls)
      response = http.request(request)
      JSON.parse(response.body)
    end

    private

    attr_reader :urls, :model_id

    def config
      @config ||= Clarifai.configuration
    end

    def valid_params?(urls)
      urls.is_a?(Array) || urls.is_a?(String)
    end

    def endpoint
      "#{config.base_url}/users/#{config.user_id}/apps/#{config.app_id}/models/#{model_id}/outputs"
    end

    def headers
      @headers ||= {
        Authorization:  "Key #{config.pat}",
        'Content-Type': 'application/json'
      }
    end

    def setup_http_client
      http = Net::HTTP.new(predict_uri.host, predict_uri.port)
      http.use_ssl = true
      http
    end

    def predict_uri
      @predict_uri ||= URI(endpoint)
    end

    def setup_predict_request(type, urls)
      request = Net::HTTP::Post.new(predict_uri.path, headers)
      request.body = predict_body(type, urls)
      request
    end

    def url_data(url)
      { data: { image: { url: url } } }
    end

    def predict_body(type, image_url)
      { inputs: [{
        data: {
          "#{type}": {
            url: image_url
          }
        }
      }] }.to_json
    end
  end
end
