class Test
  attr_accessor :id, :run_id, :requests

  def requests_count
    requests.length
  end

  def self.from_json(data)
    self.new.tap do |test|
      test.id = data['id']
      test.run_id = data['test_run_id']
      test.requests = data['requests'].map { |request| Request.from_json(request) }
    end
  end
end