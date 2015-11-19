require_relative '../test_helper'

describe RequestBuilder do
  describe 'RequestBuilder#build' do
    let(:url) { URI('http://test.com') }
    let(:basic_auth_user) { 'user' }
    let(:basic_auth_password) { 'password' }
    let(:request) { Request.new.tap { |request| request.uri = url }}

    it 'must set http basic auth headers' do
      request.basic_auth_user = basic_auth_user
      request.basic_auth_password = basic_auth_password

      connection = RequestBuilder.new(request).build

      connection.headers['Authorization'].must_include 'Basic'
    end

    it 'must set given http headers' do
      request.headers = { 'Content-Type' => 'application/json' }

      connection = RequestBuilder.new(request).build

      connection.headers.must_include 'Content-Type'
      connection.headers['Content-Type'].must_equal 'application/json'
    end

    it 'must set given query params' do
      request.url_params = { 'test' => 'test' }

      connection = RequestBuilder.new(request).build

      connection.params.must_include 'test'
      connection.params['test'].must_equal 'test'
    end
  end
end