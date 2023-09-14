# clarifai-rb

An unofficial Ruby wrapper for [Clarifai](https://www.clarifai.com/) V2 API with the latest `user_id` and `app_id` scoping.

## Contents

1. [Getting Started](https://github.com/shabanzo/clarifai-rb/blob/main/README.md#getting-started)
2. [Configuration](https://github.com/shabanzo/clarifai-rb/blob/main/README.md#configuration)
3. [Usage](https://github.com/shabanzo/clarifai-rb/blob/main/README.md#usage)

## Getting Started

Add this line to your application's Gemfile:

```
gem 'clarification'
```

And then execute:

```
bundle install
```

Or install it yourself as:

```
gem install clarifai-rb
```

## Configuration

```ruby
Clarifai.configure do |config|
  config.user_id = '<your_user_id>'
  config.app_id = '<your_app_id>'
  config.pat = '<your_pat>' # Personal Access Tokens
end
```

If you're using Rails, create a new file named `clarifai.rb` inside `config/initializers` and copy the configuration above.

## Usage

For single url:

```ruby
predict_instance = Clarifai::Predict.new(model_id: '<your_model_id>')
predict_instance.call(
  type: 'image',
  urls: '<image_url>'
)
```

For multiple urls:

```ruby
predict_instance = Clarifai::Predict.new(model_id: '<your_model_id>')
predict_instance.call(
  type: 'image',
  urls: ['<image_url_1>', '<image_url_2>']
)
```

### Supported types:

1. image
2. video
3. text
