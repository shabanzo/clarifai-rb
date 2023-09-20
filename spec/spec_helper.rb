# frozen_string_literal: true

$LOAD_PATH.unshift(File.expand_path('../lib', __dir__))

require 'simplecov'
require 'bundler/setup'
require 'clarifai'
require 'vcr'
require 'webmock/rspec'
require 'yaml'

SimpleCov.start

WebMock.disable_net_connect!(allow_localhost: true)

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr_cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

Clarifai.configure do |config|
  config.user_id = 'shabanzo'
  config.app_id = 'sandbox'
  config.pat = '68a0794c0d254c0dbd7fe5178be11cbf'
end
