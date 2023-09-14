# frozen_string_literal: true

require "open-uri"

module Clarifai
  class Predict
    @supported_types = %w[image video text]

    def initialize(model_id:)
      @model_id = model_id
    end

    def call(type:, urls:)
      raise "Type is not supported! (#{supported_types.join(', ')} only)" unless supported_types.include?(type)
      raise 'Input data not supported! (Array of Strings or String only)' unless valid_params?(urls)

      request = setup_predict_request(type, urls)
      response = @http.request(request)
      JSON.parse(response.body).symbolize_keys
    end

    private

    attr_reader :urls, :model_id

    def valid_params?(urls)
      urls.is_a?(Array) || urls.is_a?(String)
    end

    def endpoint
      "#{Clarifai.base_url}/users/#{Clarifai.user_id}/apps/#{Clarifai.app_id}/models/#{model}/outputs"
    end

    def headers
      @headers ||= {
        Authorization:  "Key #{Clarifai.pat}",
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
