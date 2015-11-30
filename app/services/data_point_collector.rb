class DataPointCollector
  def initialize(data_point, extractor)
    @data_point = data_point
    @extractor = extractor
  end

  def collect
    @extractor.value(@data_point.property)
  end
end