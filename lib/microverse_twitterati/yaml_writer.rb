require 'byebug'

module MicroverseTwitterati
  class YamlWriter
    def initialize(file_path, type:, add:)
      @file_path = file_path
      @type = type
      @add = add
    end

    def write!
      File.new(file_path, 'w') unless File.exist?(file_path)

      @doc = YAML.load_file(file_path)

      if doc_initialized_with_type
        add_element
      elsif doc_initialized_with_no_type
        init_type
        add_element
      else
        init_doc
        init_type
        add_element
      end

      File.open(file_path, 'w') { |file| file.write @doc.to_yaml }
    end

    private

    def doc_initialized_with_type
      @doc && @doc[type]
    end

    def doc_initialized_with_no_type
      @doc && !@doc[type]
    end

    def init_doc
      @doc = {}
    end

    def init_type
      @doc[type] = []
    end

    def add_element
      @doc[type] << add
    end

    attr_reader :file_path, :type, :add
  end
end
