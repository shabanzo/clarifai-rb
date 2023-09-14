# frozen_string_literal: true

require 'clarifai/configuration'
require 'clarifai/predict'

require 'net/http'
require 'uri'
require 'json'

module Clarifai
  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new
      yield(self.configuration)
    end
  end
end
