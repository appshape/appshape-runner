require_relative '../test_helper'

def json_response(response)
  JSON.parse(response.body)
end

describe RequestExecutor do
  describe 'RequestExecutor#execute' do
    let(:url) { 'http://localhost:4567/echo' }

    it 'must execute request with correct http method' do
      %w{get post put patch delete options}.each do |method|
        request = Request.new.tap do |request|
          request.uri = URI(url)
          request.http_method = method
        end

        response = RequestExecutor.new(request).execute
        json_response(response)['http_method'].must_equal method
      end
    end

    it 'must pass url parameters' do
      %w{get post put patch delete options}.each do |method|
        request = Request.new.tap do |request|
          request.uri = URI(url)
          request.http_method = method
          request.url_params = { 'test' => 'test' }
        end

        response = RequestExecutor.new(request).execute
        json_response(response)['query_string_params'].key?('test').must_equal true
        json_response(response)['query_string_params']['test'].must_equal 'test'
      end
    end
  end
end