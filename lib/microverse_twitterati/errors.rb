module MicroverseTwitterati
  class Error < ::StandardError
    def initialize(msg = 'An error occured', exception_type = 'custom')
      @exception_type = exception_type
      super(msg)
    end
  end

  class UndefinedHashPair < Error
    def initialize(msg = 'Undefined key value pair')
      super(msg)
    end
  end

  class NotAHash < Error
    def initialize(msg = 'Please pass in a hash')
      super(msg)
    end
  end
end
