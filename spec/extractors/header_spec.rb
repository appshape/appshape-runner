require_relative '../test_helper'

describe Extractors::Header do
  describe 'Extractors::Header#value' do
    it 'must extract header value' do
      request = TestRequestsBuilder.new(:get).echo
      response = RequestExecutor.new(request).execute

      value = Extractors::Header.new(response).value('Content-Type')

      value.must_equal 'application/json'
    end
  end
end