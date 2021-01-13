require_relative '../spec_helper'
require './lib/microverse_twitterati/errors'
require './lib/microverse_twitterati/bot'

RSpec.describe MicroverseTwitterati::Bot do
  let(:api_settings) do
    {
      consumer_key: ENV['TWITTER_API_KEY'],
      consumer_secret: ENV['TWITTER_SECRET_KEY'],
      access_token: ENV['TWITTER_ACCESS_TOKEN'],
      access_token_secret: ENV['TWITTER_TOKEN_SECRET']
    }
  end

  let(:user_settings) do
    {
      twitter_handle: 'MicroverseB',
      hash_tag: '#microverse'
    }
  end

  let(:bot) { MicroverseTwitterati::Bot.new(api_settings, user_settings) }

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

    it 'should raise error if unwanted api_settings are passed in the api_settings hash' do
      expect { MicroverseTwitterati::Bot.new(api_settings.merge({ fake: 'fake' }), user_settings) }.to raise_error(
        MicroverseTwitterati::UndefinedHashPair
      )
    end

    it 'should set @twitter_handle' do
      expect(bot.instance_variable_get(:@twitter_handle)).to eq(user_settings[:twitter_handle])
    end

    it 'should set the @hash_tag' do
      expect(bot.instance_variable_get(:@hash_tag)).to eq(user_settings[:hash_tag])
    end
  end

  describe '#run!' do
    it 'has to be an instance of an Array' do
      VCR.use_cassette('run!') do
        expect(bot.run!).to be_a(Array)
      end
    end
  end

  describe '#find_last_retweeted' do
    it 'returns a tweet id' do
      VCR.use_cassette('find_last_retweeted') do
        expect(bot.find_last_retweeted).to be_a(Integer)
      end
    end
  end

  describe '#collect_tweets' do
    it 'collects all the tweets marked with hash_tag' do
      VCR.use_cassette('collect_tweets') do
        expect(bot.collect_tweets).to be_a(Twitter::SearchResults)
      end
    end
  end

  describe '#syndicate_for' do
    it 'retweets the tweets' do
      VCR.use_cassette('syndicate_for') do
        expect(bot.syndicate_for(['1348933345351122944'])).to be_truthy
      end
    end
  end
end
