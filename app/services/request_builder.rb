class RequestBuilder
  def initialize(request)
    @request = request
  end

  def build
    Faraday::Connection.new(@request.base_url, {
        headers: @request.headers,
        params: @request.url_params
    }) do |connection|
      connection.basic_auth(@request.basic_auth_user, @request.basic_auth_password) if @request.requires_basic_auth?
      connection.request :url_encoded
      connection.adapter :excon
    end
  end
end