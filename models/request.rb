class Request
  attr_accessor :url, :http_method, :basic_auth_user, :basic_auth_password,
                :headers, :url_params, :form_params, :assertions, :data_points

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

  def self.from_json(data)
    self.new.tap do |request|
      request.url = data['url']
      request.http_method = data['http_method']
      request.basic_auth_user = data['basic_auth_user']
      request.basic_auth_password = data['basic_auth_password']
      request.headers = data['headers'] || []
      request.url_params = data['url_params'] || []
      request.form_params = data['form_params'] || []
      request.assertions = data['assertions'] || []
      request.data_points = data['data_points'] || []
    end
  end
end