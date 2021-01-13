require_relative 'errors'

module MicroverseTwitterati
  class ValidSetting
    ACCEPTED_KEYS = %i[consumer_key consumer_secret access_token access_token_secret hash_tag twitter_handle].freeze

    def initialize(options)
      raise NotAHash unless options.is_a?(Hash)

      @options = options
    end

    def permitted?
      (options.keys - ACCEPTED_KEYS).empty?
    end

    private

    attr_reader :options
  end
end
