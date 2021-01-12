require 'twitter'
require_relative 'valid_setting'

module MicroverseTwitterati
  class Bot < Twitter::REST::Client
    def initialize(twitter_api_settings)
      raise UndefinedHashPair unless ValidSetting.new(twitter_api_settings).valid_setting?

      super(twitter_api_settings)

      @last_tweet_sent_id = nil
      @search_results = []
      @tweets = []
    end

    def run!
      @last_tweet_sent_id = find_last_retweeted
      @search_results = collect_tweets
      @tweets = process_tweets_for(@search_results)
      syndicate_for(@tweets)
    end

    def find_last_retweeted
      t = user_timeline('MicroverseB').first
      r = retweeted_by_me.first
      t.created_at > r.created_at ? t.id : r.id
    end

    def collect_tweets
      search('#microverse', result_type: 'recent', since_id: @last_tweet_sent_id, rpp: 50)
    end

    def process_tweets_for(search_results)
      tweets = []
      search_results.each { |tweet| tweets << tweet }

      tweets
    end

    def syndicate_for(tweets)
      tweets.each do |tweet|
        retweet(extract_id(tweet))
      end
    end
  end
end
