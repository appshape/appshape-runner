module Extractors
  class Header < Extractors::Base
    def value(property = nil)
      @response.headers[property]
    end
  end
end