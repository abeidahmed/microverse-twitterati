require_relative '../spec_helper'
require './lib/microverse_twitterati/yaml_writer'

RSpec.describe MicroverseTwitterati::YamlWriter do
  FILE_PATH = 'config/helloworld.yml'
  let(:writer) { MicroverseTwitterati::YamlWriter.new(
    FILE_PATH,
    type: 'blocked',
    add: 'user 1'
  ) }

  describe '#initialize' do
    it 'sets the @file_path' do
      expect(writer.instance_variable_get(:@file_path)).to eq(FILE_PATH)
    end

    it 'sets the @type' do
      expect(writer.instance_variable_get(:@type)).to eq('blocked')
    end

    it 'sets the @add' do
      expect(writer.instance_variable_get(:@add)).to eq('user 1')
    end
  end

  describe '#write!' do
    before do
      File.open(FILE_PATH, 'w') {}
    end
    it 'creates a new file if the file is not present' do
      writer.write!

      expect(File.exist? FILE_PATH).to be_truthy
    end

    it 'instantiates the document' do
      writer.write!
      doc = YAML.load_file(FILE_PATH)

      expect(doc).to be_truthy
    end

    it 'sets the blocked to empty array' do
      writer.write!
      doc = YAML.load_file(FILE_PATH)

      expect(doc['blocked']).to match_array(['user 1'])
    end

    it 'does not initializes the file again' do
      doc = MicroverseTwitterati::YamlWriter.new(
        FILE_PATH,
        type: 'blocked',
        add: 'user 2'
      )
      doc.write!
      doc.write!
      file = YAML.load_file(FILE_PATH)

      expect(file['blocked']).to match_array(['user 2', 'user 2'])
    end
  end
end
