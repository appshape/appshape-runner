class RequestExecutor
  def initialize(request, builder = RequestBuilder)
    @request = request
    @connection = builder.new(request).build
  end

  def execute
    @connection.run_request(@request.http_method, @request.path_and_query, @request.request_body, nil)
  end
end