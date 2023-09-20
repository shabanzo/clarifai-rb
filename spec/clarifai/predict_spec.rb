# frozen_string_literal: true

# spec/clarifai/predict_spec.rb

require 'spec_helper'

RSpec.describe Clarifai::Predict do
  describe '#call' do
    let(:type) { 'type' }
    let(:urls) { 'https://github.com/shabanzo/clarifai-rb/blob/main/spec/images/liquor.jpg?raw=true' }

    it 'fetches predictions for images' do
      VCR.use_cassette('clarifai_predict_images') do
        predict = described_class.new(model_id: 'general-image-recognition')

        predict.call(type: type, urls: urls)
        expect(predict.status['code']).to eq(10_000)
      end
    end
  end
end
