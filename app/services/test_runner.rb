class TestRunner
  def initialize(test)
    @test = test
  end

  def execute
    @test.requests.each do |request|
      response = RequestExecutor.new(request).execute
      s3_object_name = ResponseUploader.new(@test.id, @test.run_id).async_upload(response.body)
      extractors = initialize_extractors(request, response)

      test_results = collect_test_results(request, extractors)
      data_points = collect_data_points(request, extractors)
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
    end
  end

  def collect_data_points(request, extractors)
    request.data_points.map do |data_point|
      DataPointCollector.new(data_point, extractors[assertion.source_code]).collect
    end
  end
end