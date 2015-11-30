require_relative '../test_helper'

describe Extractors::Text do
  describe 'Extractors::Text.value' do
    it 'must return response body as string' do
      request = TestRequestsBuilder.new(:get).body
      response = RequestExecutor.new(request).execute

      value = Extractors::Text.new(response).value

      value.must_equal 'response body'
    end
  end
end
