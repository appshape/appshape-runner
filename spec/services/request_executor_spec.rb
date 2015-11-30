require_relative '../test_helper'

def json_response(response)
  JSON.parse(response.body)
end

describe RequestExecutor do
  describe 'RequestExecutor#execute' do
    let(:url) { 'http://localhost:4567/echo' }

    it 'must execute request with correct http method' do
      %w{get post put patch delete options}.each do |method|
        request = TestRequestsBuilder.new(method.to_sym).echo

        response = RequestExecutor.new(request).execute

        json_response(response)['http_method'].must_equal method
      end
    end

    it 'must pass url parameters' do
      %w{get post put patch delete options}.each do |method|
        request = TestRequestsBuilder.new(method.to_sym).echo(url_params: { 'test' => 'test' })

        response = RequestExecutor.new(request).execute

        json_response(response)['query_string_params'].key?('test').must_equal true
        json_response(response)['query_string_params']['test'].must_equal 'test'
      end
    end

    it 'must pass form parameters' do
      %w{post put patch delete}.each do |method|
        request = TestRequestsBuilder.new(method.to_sym).echo(form_params: { 'test' => 'test' }, body: nil)

        response = RequestExecutor.new(request).execute

        json_response(response)['form_params'].key?('test').must_equal true
        json_response(response)['form_params']['test'].must_equal 'test'
      end
    end

    it 'must pass request body' do
      %w{post put patch delete}.each do |method|
        request = TestRequestsBuilder.new(method.to_sym).echo(body: '{"test": "test"}')

        response = RequestExecutor.new(request).execute

        json_response(response)['body'].must_equal request.body
      end
    end

    it 'must pass correct headers' do
      %w{get post put patch delete options}.each do |method|
        request = TestRequestsBuilder.new(method.to_sym).echo(body: nil, headers: { 'User-Agent' => 'AppShape' })

        response = RequestExecutor.new(request).execute

        json_response(response)['headers'].key?('USER_AGENT').must_equal true
        json_response(response)['headers']['USER_AGENT'].must_equal 'AppShape'
      end
    end

    it 'must set correct content type' do
      %w{post put patch delete options}.each do |method|
        request = TestRequestsBuilder.new(method.to_sym).echo(body: nil, headers: { 'Accept' => 'Accept: audio/*; q=0.2, audio/basic' })

        response = RequestExecutor.new(request).execute
        json_response(response)['headers']['ACCEPT'].must_equal 'Accept: audio/*; q=0.2, audio/basic'
      end
    end
  end
end