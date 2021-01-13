require 'twitter'
require_relative 'valid_setting'
require_relative 'blocked_user'

module MicroverseTwitterati
  class Bot < Twitter::REST::Client
    def initialize(twitter_api_settings, user_settings)
      raise UndefinedHashPair unless ValidSetting.new(twitter_api_settings.merge(user_settings)).permitted?

      super(twitter_api_settings)

      @twitter_handle = user_settings[:twitter_handle]
      @hash_tag = user_settings[:hash_tag]
      @last_tweet_sent_id = nil
      @search_results = []
      @tweets = []
    end

    def run!
      update_blocked_users
      @last_tweet_sent_id = find_last_retweeted
      @search_results = collect_tweets
      @tweets = process_tweets_for(@search_results)
      syndicate_for(@tweets)
    end

    def find_last_retweeted
      tweet = user_timeline(twitter_handle).first
      retweet = retweeted_by_me.first
      tweet.created_at > retweet.created_at ? tweet.id : retweet.id
    end

    def collect_tweets
      search(hash_tag, result_type: 'recent', since_id: @last_tweet_sent_id, rpp: 50)
    rescue Twitter::Error::ServiceUnavailable
      abort 'Service is currently unavailable.'
    rescue Faraday::Error::ConnectionFailed
      abort 'There seems to be a connection problem.'
    end

    def syndicate_for(tweets)
      tweets.each { |tweet| retweet(extract_id(tweet)) }
    end

    def update_blocked_users
      list = blocked_ids.collect(&:to_s)
      BlockedUser.new.block(list)
    end

    private

    def process_tweets_for(search_results)
      search_results.select { |tweet| !blocked?(tweet.user) }
    end

    def blocked?(user)
      BlockedUser.new.blocked_users.include?(user.id)
    end

    attr_reader :hash_tag, :twitter_handle
  end
end
