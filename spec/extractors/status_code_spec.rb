require_relative '../test_helper'

describe Extractors::StatusCode do
  describe 'Extractors::StatusCode.value' do
    it 'must return correct value when endpoint returns ok status code' do
      request = TestRequestsBuilder.new(:get).echo
      response = RequestExecutor.new(request).execute

      value = Extractors::StatusCode.new(response).value

      value.must_equal 200
    end

    it 'must return correct value when endpoint returns error' do
      request = TestRequestsBuilder.new(:get).error_500
      response = RequestExecutor.new(request).execute

      value = Extractors::StatusCode.new(response).value

      value.must_equal 500
    end
  end
end
