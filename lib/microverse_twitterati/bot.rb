require 'twitter'

module MicroverseTwitterati
  class Bot < Twitter::REST::Client
    def initialize(twitter_api_settings)
      super(twitter_api_settings)

      @last_tweet_sent_id = nil
      @search_results = []
      @tweets = []
    end

    def process_tweets_for(search_results)
      tweets = []
      search_results.each { |tweet| tweets << tweet }

      tweets
    end
  end
end
