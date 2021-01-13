require_relative '../spec_helper'
require_relative '../../lib/microverse_twitterati/yaml_writer'
require_relative '../../lib/microverse_twitterati/blocked_user'

RSpec.describe MicroverseTwitterati::BlockedUser do
  file_path = 'config/blocked_user.yml'.freeze

  let(:blocked) { MicroverseTwitterati::BlockedUser.new }
  let(:writer) { MicroverseTwitterati::YamlWriter.new(file_path, type: 'blocked_user') }

  describe '#initialize' do
    it 'sets the @doc' do
      expect(blocked.instance_variable_get(:@doc)).to be_a(MicroverseTwitterati::YamlWriter)
    end
  end

  describe '#block' do
    it 'blocks the user' do
      users = %w[mma hello world]
      blocked.block(users)

      expect(blocked.doc.read).to match_array(users)
    end

    it 'does not block the user multiple times' do
      users = %w[hello bye]
      blocked.block(users)

      expect(blocked.doc.read).to match_array(%w[hello bye])
    end
  end

  describe '#blocked_users' do
    it 'returns an array of blocked users' do
      blocked.block(%w[hello bye])

      expect(blocked.blocked_users).to match_array(%w[hello bye])
    end
  end
end
