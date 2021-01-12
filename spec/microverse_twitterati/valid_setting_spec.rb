require_relative '../spec_helper'
require './lib/microverse_twitterati/valid_setting'

RSpec.describe MicroverseTwitterati::ValidSetting do
  let(:valid_hash) { { consumer_key: 'world', consumer_secret: 'world' } }
  let(:invalid_hash) { { hello: 'world', consumer_key: 'world' } }

  describe '#initialize' do
    it 'should raise an error if the arg is not an hash' do
      expect { MicroverseTwitterati::ValidSetting.new('helloworld') }.to raise_error(MicroverseTwitterati::NotAHash)
    end
  end

  describe '#permitted?' do
    it 'should return true if the keys are valid' do
      setting = MicroverseTwitterati::ValidSetting.new(valid_hash)

      expect(setting.permitted?).to be_truthy
    end

    it 'should return false if the keys are invalid' do
      setting = MicroverseTwitterati::ValidSetting.new(invalid_hash)

      expect(setting.permitted?).to be_falsy
    end
  end
end
