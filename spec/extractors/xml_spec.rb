require_relative '../test_helper'

describe Extractors::Xml do
  describe 'Extractors::Xml.value' do
    describe 'using xpath selector' do
      [
          { property: '//status', value: ['ok'] },
          { property: '//products/product/name', value: ['Product 1', 'Product 2'] },
          { property: '//products/product[@id="1"]/name', value: ['Product 1'] }
      ].each do |test|
        it 'must return correct value' do
          request = TestRequestsBuilder.new(:get).xml_extractor
          response = RequestExecutor.new(request).execute

          value = Extractors::Xml.new(response).value(test[:property])

          value.must_equal test[:value]
        end
      end
    end

    # describe 'using css selector' do
    #   [
    #       { property: 'status', value: ['ok'] },
    #       { property: 'products product name', value: ['Product 1', 'Product 2'] },
    #       { property: 'products product#1 name', value: ['Product 1'] }
    #   ].each do |test|
    #     it 'must return correct value' do
    #       request = TestRequestsBuilder.new(:get).xml_extractor
    #       response = RequestExecutor.new(request).execute
    #
    #       value = Extractors::Xml.new(response).value(test[:property])
    #       value.must_equal test[:value]
    #     end
    #   end
    # end
  end
end