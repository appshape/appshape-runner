require 'uri'

class Request
  attr_accessor :uri, :http_method, :basic_auth_user, :basic_auth_password,
                :headers, :body, :url_params, :form_params, :assertions, :data_points

  def base_url
    "#{uri.scheme}://#{uri.host}:#{uri.port}"
  end

  def path_and_query
    "#{uri.path}?#{uri.query}##{uri.fragment}"
  end

  def requires_basic_auth?
    !basic_auth_password.nil? || !basic_auth_password.nil?
  end

  def requires_url_params?
    !url_params.nil? && !url_params.empty?
  end

  def requires_form_params?
    !form_params.nil? && !form_params.empty?
  end

  def requires_headers?
    !headers.nil? && !headers.empty?
  end

  def request_body
    body.nil? ? form_params : body
  end

  def sources
    (assertions.map(&:source_code) + data_points.map(&:source_code)).uniq
  end

  def self.from_json(data)
    self.new.tap do |request|
      request.uri = URI(data['url'])
      request.http_method = data['http_method']
      request.basic_auth_user = data['basic_auth_user']
      request.basic_auth_password = data['basic_auth_password']
      request.headers = convert_to_key_value_hash(data['headers'] || [])
      request.url_params = convert_to_key_value_hash(data['url_params'] || [])
      request.form_params = convert_to_key_value_hash(data['form_params'] || [])
      request.assertions = data['assertions'] || []
      request.data_points = data['data_points'] || []
      request.body = data['body']
    end
  end

  private
  def self.convert_to_key_value_hash(input, key_field = 'name', value_field = 'value')
    input.inject({}) { |memo, entry| memo[entry[key_field]] = entry[value_field]; memo }
  end
end