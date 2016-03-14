module Extractors
  class ResponseTime < Extractors::Base
    def value(property = nil)
      @response.headers['X-Faraday-Runtime'].to_f rescue nil
    end
  end
end