#!/usr/bin/env ruby

require 'dotenv/load'
require_relative '../lib/microverse_twitterati/bot'

TWITTER_API_SETTINGS = {
  consumer_key: ENV['TWITTER_API_KEY'],
  consumer_secret: ENV['TWITTER_SECRET_KEY'],
  access_token: ENV['TWITTER_ACCESS_TOKEN'],
  access_token_secret: ENV['TWITTER_TOKEN_SECRET']
}.freeze

USER_SETTINGS = {
  twitter_handle: 'MicroverseB',
  hash_tag: '#microverse'
}.freeze

MicroverseTwitterati::Bot.new(TWITTER_API_SETTINGS, USER_SETTINGS).run!
