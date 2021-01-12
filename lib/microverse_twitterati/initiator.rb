# require 'dotenv/load'
# require 'byebug'
# require 'twitter'

# module MicroverseTwitterati
#   class Initiator
#     attr_reader :client

#     def initialize
#       @client = initialize_retweet
#     end

#     def find_last_retweeted
#       tweeter = client.user_timeline.first
#       retweeted = client.home_timeline.first
#       tweeter.created_at > retweeted.created_at ? tweeter.id : retweeted.id
#     end

#     def initialize_retweet
#       Twitter::REST::Client.new do |config|
#         config.consumer_key = ENV['TWITTER_API_KEY']
#         config.consumer_secret = ENV['TWITTER_SECRET_KEY']
#         config.access_token = ENV['TWITTER_ACCESS_TOKEN']
#         config.access_token_secret = ENV['TWITTER_TOKEN_SECRET']
#       end
#     end
#   end
# end
