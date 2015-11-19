require_relative '../test_helper'

describe Request do
  describe 'Request.from_json' do
    before do
      @data = {
          'url' => 'http://test-url.com',
          'http_method' => 'post',
          'basic_auth_user' => 'test',
          'basic_auth_password' => 'test',
          'headers' => [{ 'name' => 'User-Agent', 'value' => 'AppShape' }],
          'url_params' => [{ 'name' => 'test', 'value' => 'test' }],
          'form_params' => [{ 'name' => 'test', 'value' => 'test' }],
          'assertions' => [],
          'data_points' => [],
          'body' => 'body'
      }
    end

    it 'must return new request object' do
      Request.from_json(@data).is_a?(Request).must_equal true
    end

    it 'must assign all required attributes' do
      request = Request.from_json(@data)

      request.uri.to_s.must_equal @data['url']
      request.http_method.must_equal @data['http_method']
      request.basic_auth_user.must_equal @data['basic_auth_user']
      request.basic_auth_password.must_equal @data['basic_auth_password']

      request.headers.is_a?(Hash).must_equal true
      request.headers.key?('User-Agent').must_equal true
      request.headers['User-Agent'].must_equal 'AppShape'

      request.url_params.is_a?(Hash).must_equal true
      request.url_params.key?('test').must_equal true
      request.url_params['test'].must_equal 'test'

      request.form_params.is_a?(Hash).must_equal true
      request.form_params.key?('test').must_equal true
      request.form_params['test'].must_equal 'test'

      request.assertions.length.must_equal @data['assertions'].length
      request.data_points.length.must_equal @data['data_points'].length
      request.body.must_equal @data['body']
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

  describe 'Request#base_url' do
    let(:expected_domain) { 'http://test-domain.com' }

    it 'must return correct base url for random inputs' do
      @request = Request.new.tap { |request| request.uri =  URI('http://test-domain.com/') }
      @request.base_url.must_equal 'http://test-domain.com'

      @request = Request.new.tap { |request| request.uri = URI('http://test-domain.com/subfolder') }
      @request.base_url.must_equal 'http://test-domain.com'

      @request = Request.new.tap { |request| request.uri = URI('http://test-domain.com/subfolder?param') }
      @request.base_url.must_equal 'http://test-domain.com'

      @request = Request.new.tap { |request| request.uri = URI('http://test-domain.com/subfolder#param') }
      @request.base_url.must_equal 'http://test-domain.com'
    end
  end

end