class TestRequestsBuilder
  def initialize(http_method)
    @request = Request.new.tap do |request|
      request.http_method = http_method
    end
  end

  def echo(headers: {}, url_params: {}, form_params: {}, body: nil)
    request('http://localhost:4567/echo', headers, url_params, form_params, body)
  end

  def json_extractor
    request('http://localhost:4567/json_extractor', {}, {}, {}, nil)
  end

  def xml_extractor
    request('http://localhost:4567/xml_extractor', {}, {}, {}, nil)
  end

  def error_500
    request('http://localhost:4567/error_500', {}, {}, {}, nil)
  end

  def body
    request('http://localhost:4567/body', {}, {}, {}, nil)
  end

  private
  def request(url, headers, url_params, form_params, body)
    @request.tap do |request|
      request.uri = URI(url)
      request.headers = headers
      request.url_params = url_params
      request.form_params = form_params
      request.body = body
    end
  end
end