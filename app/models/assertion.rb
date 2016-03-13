class Assertion
  attr_accessor :source_code, :property, :condition_code, :value

  def self.from_json(data)
    Assertion.new.tap do |assertion|
      assertion.source_code = data['source_code']
      assertion.property = data['property']
      assertion.condition_code = data['condition_code']
      assertion.value = data['value']
    end
  end
end