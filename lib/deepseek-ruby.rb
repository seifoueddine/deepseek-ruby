require 'deepseek-ruby/client'
require 'deepseek-ruby/version'

module Deepseek
  class << self
    def configuration
      Client.configuration
    end

    def configure
      Client.configure { |config| yield(config) }
    end
  end
end