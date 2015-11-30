module Extractors
  class Xml < Extractors::Base
    def initialize(response)
      super(response)
      @document = Nokogiri::HTML(@response.body)
    end

    def value(property = nil)
      @document.search(property).map(&:content)
    end
  end
end