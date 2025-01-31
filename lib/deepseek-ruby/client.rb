require 'faraday'
require 'json'

module Deepseek
  class Configuration
    attr_accessor :api_key, :base_url, :http_adapter

    def initialize
      @base_url = 'https://api.deepseek.com/v1'
      @http_adapter = Faraday.default_adapter
    end
  end

  class Client
    class << self
      attr_accessor :configuration
    end

    def self.configure
      self.configuration ||= Configuration.new
      yield(configuration)
    end

    def initialize
      @conn = Faraday.new(url: self.class.configuration.base_url) do |f|
        f.request :json
        f.response :json
        f.adapter self.class.configuration.http_adapter
        f.headers['Content-Type'] = 'application/json'
        f.headers['Accept'] = 'application/json'
        f.headers['Authorization'] = "Bearer #{self.class.configuration.api_key}"
      end
    end

    def chat_completions(params)
      validate_params(params)
      response = @conn.post('/chat/completions') do |req|
        req.body = params.to_json
      end
      handle_response(response)
    end

    private

    def validate_params(params)
      raise ArgumentError, "messages is required" unless params[:messages]
      raise ArgumentError, "model is required" unless params[:model]
    end

    def handle_response(response)
      case response.status
      when 200..299
        Response.new(response.body)
      else
        raise ApiError.new(response.status, response.body)
      end
    end
  end

  class Response
    attr_reader :data

    def initialize(data)
      @data = data
    end

    def choices
      data['choices']
    end

    def usage
      data['usage']
    end
  end

  class ApiError < StandardError
    attr_reader :status, :body

    def initialize(status, body)
      @status = status
      @body = body
      super("API Error: #{status} - #{body}")
    end
  end
end