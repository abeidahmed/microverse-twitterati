require_relative '../spec_helper'
require_relative '../../lib/microverse_twitterati/retweet'

RSpec.describe MicroverseTwitterati::Retweet do
  let(:tweet) { MicroverseTwitterati::Retweet.new }

  describe '#initialize' do
    it 'client should not be nil' do
      VCR.use_cassette('client should not be nil') do
        expect(tweet.client).not_to be_nil
      end
    end
  end

  describe '#retweet!' do
    it 'should retweet the tweet that has the hash_tag' do
      VCR.use_cassette('tweets the tweet that has hash_tag') do
        expect(tweet.retweet!).to be_a(Twitter::Cursor)
      end
    end
  end
end
