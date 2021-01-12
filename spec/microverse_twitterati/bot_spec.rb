require 'dotenv/load'
require 'byebug'
require_relative '../spec_helper'
require_relative '../../lib/microverse_twitterati/bot'

RSpec.describe MicroverseTwitterati::Bot do
  let(:api_settings) do
    {
      consumer_key: ENV['TWITTER_API_KEY'],
      consumer_secret: ENV['TWITTER_SECRET_KEY'],
      access_token: ENV['TWITTER_ACCESS_TOKEN'],
      access_token_secret: ENV['TWITTER_TOKEN_SECRET']
    }
  end

  let(:bot) { MicroverseTwitterati::Bot.new(api_settings) }

  describe '#initialize' do
    it 'should set @last_tweet_send_id to nil' do
      expect(bot.instance_variable_get(:@last_tweet_send_id)).to eq(nil)
    end

    it 'should set @search_results to an empty array' do
      expect(bot.instance_variable_get(:@search_results)).to match_array([])
    end

    it 'should set @tweets to an empty array' do
      expect(bot.instance_variable_get(:@tweets)).to match_array([])
    end
  end

  describe 'process_tweets_for' do
    it 'should shovel the args in an array and return the array' do
      expect(bot.process_tweets_for(['hello world'])).to eq(['hello world'])
    end
  end

  describe '#find_last_retweeted' do
    it 'returns a tweet id' do
      VCR.use_cassette('find_last_retweeted') do
        expect(bot.find_last_retweeted).to be_a(Integer)
      end
    end
  end
end
