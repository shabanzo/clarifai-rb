# frozen_string_literal: true

require 'clarifai/predict'

require 'net/http'
require 'uri'
require 'json'

module Clarifai
  @base_url = "https://api.clarifai.com/v2/"

  def self.configure
    yield self
  end
end
