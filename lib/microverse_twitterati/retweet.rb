require 'dotenv/load'
require_relative './initiator'

module MicroverseTwitterati
  class Retweet
    HASH_TAG = '#microverse'.freeze

    attr_reader :client

    def initialize
      @client = Initiator.new.client
      retweet!
    end

    def retweet!
      bot_followers.each do |follower_id|
        client.user_timeline(follower_id, result_type: 'recent').each do |tweet|
          client.retweet(tweet.id) if tweet.text.include? HASH_TAG
        end
      end
    end

    private

    def bot_followers
      client.follower_ids
    end
  end
end
