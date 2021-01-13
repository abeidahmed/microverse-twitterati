require 'yaml'

module MicroverseTwitterati
  class YamlWriter
    def initialize(file_path, type:)
      @file_path = file_path
      @type = type
    end

    def write(element)
      File.new(file_path, 'w') unless File.exist?(file_path)

      @doc = YAML.load_file(file_path)

      # rubocop:disable Style/IdenticalConditionalBranches
      if doc_initialized_with_type
        add_element(element)
      elsif doc_initialized_with_no_type
        init_type
        add_element(element)
      else
        init_doc
        init_type
        add_element(element)
      end
      # rubocop:enable Style/IdenticalConditionalBranches

      File.open(file_path, 'w') { |file| file.write @doc.to_yaml }
    end

    def read
      @doc = YAML.load_file(file_path)

      if doc_initialized_with_type
      elsif doc_initialized_with_no_type
        init_type
      else
        init_doc
        init_type
      end

      @doc[type]
    end

    def reset
      File.open(file_path, 'w') { |file| file.truncate(0) }
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

    def add_element(element)
      @doc[type] << element
    end

    attr_reader :file_path, :type
  end
end
