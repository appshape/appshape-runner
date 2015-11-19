class TestRunner
  def initialize(test)
    @test = test
  end

  def execute
    responses = Parallel.map(@test.requests, in_threads: @test.requests_count) do |request|
      RequestExecutor.new(request).execute
    end
  end
end