class AssertionTester
  def initialize(assertion, extractor)
    @assertion = assertion
    @extractor = extractor
  end

  def test
    value = @extractor.value(@assertion.property)
    unless ConditionFactory.get(@assertion.condition_code).compare(value, @assertion.value)
      {
         source_code: @assertion.source_code,
         property: @assertion.property,
         condition_code: @assertion.condition_code,
         other_value: @assertion.value,
         value: value
      }
    end
  end
end