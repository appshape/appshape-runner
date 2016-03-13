class TestRunner
  def initialize(test)
    @test = test
  end

  def execute
    @test.requests.map do |request|

      Logger.instance.info "[T: #{@test.id}][TR: #{@test.run_id}] #{request.http_method.upcase} #{request.base_url}#{request.path_and_query}"

      response = RequestExecutor.new(request).execute

      extractors = initialize_extractors(request, response)

      {
        request_id: request.id,
        failed_assertions: collect_test_results(request, extractors),
        data_points: collect_data_points(request, extractors),
        s3_object_name: 'some name',#ResponseUploader.new(@test.id, @test.run_id).async_upload(response.body),
        executed_at: Time.now.iso8601
      }
    end
  end

  private
  def initialize_extractors(request, response)
    request.sources.inject({}) do |memo, source|
      memo[source] = ExtractorFactory.get(source, response)
      memo
    end
  end

  def collect_test_results(request, extractors)
    request.assertions.map do |assertion|
      AssertionTester.new(assertion, extractors[assertion.source_code]).test
    end.compact
  end

  def collect_data_points(request, extractors)
    request.data_points.map do |data_point|
      DataPointCollector.new(data_point, extractors[data_point.source_code]).collect
    end.compact
  end
end