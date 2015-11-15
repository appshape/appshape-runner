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

  describe 'Request#requires_basic_auth?' do
    describe 'basic auth data is present' do
      before do
        @request = Request.new.tap do |request|
          request.basic_auth_user = nil
          request.basic_auth_password = 'password'
        end
      end

      it 'must return true' do
        @request.requires_basic_auth?.must_equal true
      end
    end

    describe 'basic auth data is missing' do
      before do
        @request = Request.new
      end

      it 'must return false' do
        @request.requires_basic_auth?.must_equal false
      end
    end
  end

  describe 'Request#requires_url_params?' do
    it 'must return true when url params are present' do
      @request = Request.new.tap { |request| request.url_params = [1,2,3] }
      @request.requires_url_params?.must_equal true
    end

    it 'must return false when url params are missing' do
      @request = Request.new.tap { |request| request.url_params = [] }
      @request.requires_url_params?.must_equal false
    end
  end

  describe 'Request#requires_form_params?' do
    it 'must return true when form params are present' do
      @request = Request.new.tap { |request| request.form_params = [1,2,3] }
      @request.requires_form_params?.must_equal true
    end

    it 'must return false when url params are missing' do
      @request = Request.new.tap { |request| request.form_params = [] }
      @request.requires_form_params?.must_equal false
    end
  end

  describe 'Request#requires_headers?' do
    it 'must return true when form params are present' do
      @request = Request.new.tap { |request| request.headers = [1,2,3] }
      @request.requires_headers?.must_equal true
    end

    it 'must return false when url params are missing' do
      @request = Request.new.tap { |request| request.headers = [] }
      @request.requires_headers?.must_equal false
    end
  end

end