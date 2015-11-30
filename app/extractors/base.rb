module Extractors
  class Base
    def initialize(response)
      @response = response
    end

    def value(property = nil)
      raise NotImplementedError, 'You have to implement "value" method!'
    end
  end
end