class DataPoint
  attr_accessor :source_code, :property

  def self.from_json(data)
    DataPoint.new.tap do |data_point|
      data_point.source_code = data['source_code']
      data_point.property = data['property']
    end
  end
end