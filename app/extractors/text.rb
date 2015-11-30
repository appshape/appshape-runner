module Extractors
  class Text < Extractors::Base
    def value(property = nil)
      @response.body
    end
  end
end