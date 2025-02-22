# Deepseek Ruby Client

[![Gem Version](https://badge.fury.io/rb/deepseek-ruby.svg)](https://badge.fury.io/rb/deepseek-ruby)

Official Ruby client for the Deepseek API. This library provides convenient access to the Deepseek API from applications written in Ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'deepseek-ruby'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install deepseek-ruby
```

## Usage

First, configure the gem with your API key:

```ruby
Deepseek.configure do |config|
  config.api_key = ENV['DEEPSEEK_API_KEY']
  # Optional configurations:
  # config.base_url = 'https://api.deepseek.com/v1'
  # config.http_adapter = Faraday.default_adapter
end
```

### Basic Example

```ruby
client = Deepseek::Client.new

begin
  response = client.chat_completions(
    model: "deepseek-chat",
    messages: [
      { role: "user", content: "Hello!" }
    ]
  )

  puts response.choices.first["message"]["content"]
rescue Deepseek::ApiError => e
  puts "Error #{e.status}: #{e.body}"
end
```

## Documentation

### Required Parameters

The `chat_completions` method requires:
- `model`: The ID of the model to use
- `messages`: An array of message objects with `role` and `content`

### Response Object
The response object provides:
- `choices`: Array of generated responses
- `usage`: Hash with token usage statistics

### Error Handling
The client raises `Deepseek::ApiError` for API errors, containing:
- `status`: HTTP status code
- `body`: Response body

## Contributing

Bug reports and pull requests are welcome on GitHub at [github.com/seifoueddine/deepseek-ruby](https://github.com/yourusername/deepseek-ruby).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
[file content end]

This `README.md` file includes the provided content and maintains the structure and additional sections for documentation, development, contributing, and licensing. It also includes the badge for the gem version and links to the repository.


