#!/usr/bin/env ruby

require 'dotenv/load'
require 'byebug'
require 'twitter'

HASH_TAG = '#microverse'.freeze

client = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV['TWITTER_API_KEY']
  config.consumer_secret = ENV['TWITTER_SECRET_KEY']
  config.access_token = ENV['TWITTER_ACCESS_TOKEN']
  config.access_token_secret = ENV['TWITTER_TOKEN_SECRET']
end

bot_followers = client.follower_ids

bot_followers.each do |follower_id|
  client.user_timeline(follower_id, result_type: 'recent').each do |tweet|
    client.retweet(tweet.id) if tweet.text.include? HASH_TAG
  end
end
