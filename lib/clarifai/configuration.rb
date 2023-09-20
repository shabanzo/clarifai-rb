# frozen_string_literal: true

module Clarifai
  class Configuration
    BASE_URL = 'https://api.clarifai.com/v2/'
    attr_accessor :user_id, :app_id, :pat, :base_url

    def initialize
      @base_url = BASE_URL
    end
  end
end
