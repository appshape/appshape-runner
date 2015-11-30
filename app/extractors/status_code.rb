module Extractors
  class StatusCode < Extractors::Base
    def value(property = nil)
      @response.status.to_i
    end
  end
end