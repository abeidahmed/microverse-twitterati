require 'twitter'

module MicroverseTwitterati
  class Initiator
    attr_reader :client

    def initialize
      @client = setup_client
    end

    private

    def setup_client
      Twitter::REST::Client.new do |config|
        config.consumer_key = ENV['TWITTER_API_KEY']
        config.consumer_secret = ENV['TWITTER_SECRET_KEY']
        config.access_token = ENV['TWITTER_ACCESS_TOKEN']
        config.access_token_secret = ENV['TWITTER_TOKEN_SECRET']
      end
    end
  end
end
