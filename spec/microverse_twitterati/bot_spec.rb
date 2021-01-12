require_relative '../spec_helper'
require_relative '../../lib/microverse_twitterati/bot'

RSpec.describe MicroverseTwitterati::Bot do
  let(:api_settings) do
    {
      consumer_key: 'fake_consumer_key',
      consumer_secret: 'fake_consumer_secret_key',
      access_token: 'fake_access_token',
      access_token_secret: 'fake_access_token_secret'
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
end
