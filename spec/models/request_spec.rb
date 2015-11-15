require_relative '../test_helper'

describe Request do
  describe 'Request.from_json' do
    before do
      @data = {
          'url' => 'http://test-url.com',
          'http_method' => 'post',
          'basic_auth_user' => 'test',
          'basic_auth_password' => 'test',
          'headers' => [],
          'url_params' => [],
          'form_params' => [],
          'assertions' => [],
          'data_points' => []
      }
    end

    it 'must return new request object' do
      Request.from_json(@data).is_a?(Request).must_equal true
    end

    it 'must assign all required attributes' do
      request = Request.from_json(@data)

      request.url.must_equal @data['url']
      request.http_method.must_equal @data['http_method']
      request.basic_auth_user.must_equal @data['basic_auth_user']
      request.basic_auth_password.must_equal @data['basic_auth_password']
      request.headers.length.must_equal @data['headers'].length
      request.url_params.length.must_equal @data['url_params'].length
      request.form_params.length.must_equal @data['form_params'].length
      request.assertions.length.must_equal @data['assertions'].length
      request.data_points.length.must_equal @data['data_points'].length
    end
  end
end