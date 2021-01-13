require_relative '../spec_helper'
require './lib/microverse_twitterati/blocked_user'

RSpec.describe MicroverseTwitterati::BlockedUser do
  file_path = '/config/blocked_user.yml'.freeze

  let(:blocked) { MicroverseTwitterati::BlockedUser.new(file_path, user: 'John Doe') }

  describe '#initialize' do
    it 'sets the @file_path' do
      expect(blocked.instance_variable_get(:@file_path)).to eq(file_path)
    end

    it 'sets the @user' do
      expect(blocked.instance_variable_get(:@user)).to eq('John Doe')
    end
  end
end
