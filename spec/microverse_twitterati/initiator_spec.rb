require_relative '../spec_helper'
require_relative '../../lib/microverse_twitterati/initiator'

RSpec.describe MicroverseTwitterati::Initiator do
  let(:tweet) { MicroverseTwitterati::Initiator.new }

  describe '#initialize' do
    it 'should return a 201 status code' do
      VCR.use_cassette('returns a 201 status code') do
        expect(tweet).not_to be_nil
      end
    end
  end

  describe '#find_last_retweeted' do
    it 'should retrieve the first retweeted tweet' do
      VCR.use_cassette('returns the first tweet') do
        expect(tweet.find_last_retweeted).not_to be_nil
      end
    end
  end
end
