require_relative '../spec_helper'
require './lib/microverse_twitterati/yaml_writer'

RSpec.describe MicroverseTwitterati::YamlWriter do
  file_path = 'config/helloworld.yml'.freeze

  let(:writer) do
    MicroverseTwitterati::YamlWriter.new(
      file_path,
      type: 'blocked',
      add: 'user 1'
    )
  end

  describe '#initialize' do
    it 'sets the @file_path' do
      expect(writer.instance_variable_get(:@file_path)).to eq(file_path)
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
      File.open(file_path, 'w') { |file| file.truncate(0) }
    end
    it 'creates a new file if the file is not present' do
      writer.write!

      expect(File.exist?(file_path)).to be_truthy
    end

    it 'instantiates the document' do
      writer.write!
      doc = YAML.load_file(file_path)

      expect(doc).to be_truthy
    end

    it 'sets the blocked to empty array' do
      writer.write!
      doc = YAML.load_file(file_path)

      expect(doc['blocked']).to match_array(['user 1'])
    end

    it 'does not initializes the file again' do
      doc = MicroverseTwitterati::YamlWriter.new(
        file_path,
        type: 'blocked',
        add: 'user 2'
      )
      2.times { doc.write! }
      file = YAML.load_file(file_path)

      expect(file['blocked']).to match_array(['user 2', 'user 2'])
    end
  end
end
