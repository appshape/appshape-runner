class ExtractorFactory
  def self.get(source_code, response)
    "Extractors::#{source_code.classify}".constantize.new(response)
  end
end