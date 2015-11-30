require_relative '../test_helper'

describe Extractors::Json do
  describe 'Extractors::Json.value' do
    [
      { property: '$.status', value: ['ok'] },
      { property: '$.products[?(@.id==1)].name', value: ['Product 1'] },
      { property: '$.products', value: [[
          { 'id' => 1, 'name' => 'Product 1', 'score' => 12.4 },
          { 'id' => 2, 'name' => 'Product 2' }]]
      }
    ].each do |test|
      it 'must return correct value' do
        request = TestRequestsBuilder.new(:get).json_extractor
        response = RequestExecutor.new(request).execute

        value = Extractors::Json.new(response).value(test[:property])

        value.must_equal test[:value]
      end
    end
  end
end