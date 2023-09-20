# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name        = 'clarifai-rb'
  s.version     = '0.0.5'
  s.summary     = 'An unofficial Ruby wrapper for Clarifai V2 API with the latest user_id and app_id scoping'
  s.description = 'Alpha Version - Predict using Clarifai'
  s.authors     = ["Muhamad Rizky Sya'ban"]
  s.email       = 'rizkyshaban@gmail.com'
  s.files       = `git ls-files`.split("\n")
  s.executables   = s.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  s.require_paths = ['lib']
  s.homepage =
    'https://rubygems.org/gems/clarifai-rb'
  s.license = 'MIT'
  s.required_ruby_version = '>=2.6'

  s.metadata['rubygems_mfa_required'] = 'true'
  s.metadata['documentation_uri'] = 'https://github.com/shabanzo/clarifai-rb'
end
