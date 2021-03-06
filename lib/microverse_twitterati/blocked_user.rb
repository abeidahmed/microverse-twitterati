require_relative 'yaml_writer'

module MicroverseTwitterati
  class BlockedUser
    FILE_PATH = 'config/blocked_user.yml'.freeze
    CATEGORY = 'blocked_users'.freeze

    attr_reader :doc

    def initialize
      @doc = YamlWriter.new(FILE_PATH, type: CATEGORY)
    end

    def block(users)
      doc.reset
      users.each { |user| doc.write(user) }
    end

    def blocked_users
      doc.read
    end
  end
end
