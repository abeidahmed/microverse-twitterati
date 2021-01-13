require_relative '../spec_helper'
require './lib/microverse_twitterati/yaml_writer'

RSpec.describe MicroverseTwitterati::YamlWriter do
  file_path = 'config/helloworld.yml'.freeze

  let(:writer) do
    MicroverseTwitterati::YamlWriter.new(
      file_path,
      type: 'blocked'
    )
  end

  describe '#initialize' do
    it 'sets the @file_path' do
      expect(writer.instance_variable_get(:@file_path)).to eq(file_path)
    end

    it 'sets the @type' do
      expect(writer.instance_variable_get(:@type)).to eq('blocked')
    end
  end

  describe '#write!' do
    before do
      File.open(file_path, 'w') { |file| file.truncate(0) }
    end
    it 'creates a new file if the file is not present' do
      writer.write('hello')

      expect(File.exist?(file_path)).to be_truthy
    end

    it 'instantiates the document' do
      writer.write('hello')
      doc = YAML.load_file(file_path)

      expect(doc).to be_truthy
    end

    it 'sets the blocked to empty array' do
      writer.write('hello')
      doc = YAML.load_file(file_path)

      expect(doc['blocked']).to match_array(['hello'])
    end

    it 'does not initializes the file again' do
      doc = MicroverseTwitterati::YamlWriter.new(
        file_path,
        type: 'blocked'
      )
      2.times { doc.write('user 2') }
      file = YAML.load_file(file_path)

      expect(file['blocked']).to match_array(['user 2', 'user 2'])
    end
  end

  describe '#read' do
    before do
      File.open(file_path, 'w') { |file| file.truncate(0) }
    end

    it 'returns the elements based on the type' do
      writer.write('hello')

      expect(writer.read).to eq(['hello'])
    end
  end
end
