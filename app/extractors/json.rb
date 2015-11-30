module Extractors
  class Json < Extractors::Base
    def value(property = nil)
      path = JsonPath.new(property)
      path.on(@response.body)
    end
  end
end