module MicroverseTwitterati
  class YamlWriter
    def initialize(file_path, type:)
      @file_path = file_path
      @type = type
      File.new(file_path, 'w') unless File.exist?(file_path)
      @doc = YAML.load_file(file_path)
    end

    def write(element)
      init_doc
      init_type
      add_element(element)

      File.open(file_path, 'w') { |file| file.write @doc.to_yaml }
    end

    def read
      doc = YAML.load_file(file_path)
      doc[type]
    end

    private

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
