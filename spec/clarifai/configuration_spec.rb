# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Clarifai::Configuration do
  describe 'initialization' do
    it 'has a default base_url' do
      config = described_class.new
      expect(config.base_url).to eq('https://api.clarifai.com/v2/')
    end
  end

  describe 'attribute accessors' do
    let(:config) { described_class.new }

    it 'can set and retrieve user_id' do
      config.user_id = 'your_user_id'
      expect(config.user_id).to eq('your_user_id')
    end

    it 'can set and retrieve app_id' do
      config.app_id = 'your_app_id'
      expect(config.app_id).to eq('your_app_id')
    end

    it 'can set and retrieve pat' do
      config.pat = 'your_pat'
      expect(config.pat).to eq('your_pat')
    end
  end
end
