require "#{File.dirname(__FILE__)}/config/application.rb"
require "#{File.dirname(__FILE__)}/config/slop.rb"

@beanstalk = Beaneater.new(ENV['BEANSTALKD_URL'])
@beanstalk_results = Beaneater.new(ENV['BEANSTALKD_RESULTS_URL'])

Logger.instance.debug "test scheduler queue url #{ENV['BEANSTALKD_URL']}"
Logger.instance.debug "results queue url #{ENV['BEANSTALKD_RESULTS_URL']}"

@options[:locations].each do |location|
  @beanstalk.jobs.register("tests-#{location}-queue") do |job|
    begin
      test = Test.from_json(JSON.parse(job.body))

      Logger.instance.info "[T: #{test.id}][TR: #{test.run_id}] performing test..."

      results = TestRunner.new(test).execute
      Logger.instance.debug "[T: #{test.id}][TR: #{test.run_id}] results: #{results}"

      @beanstalk_results.tubes.find('test-results').put({
        run_id: test.run_id,
        results: results
      }.to_json)
    rescue Exception => ex
      puts ex
      puts ex.backtrace.join('\n')
    end
  end
end

@beanstalk.jobs.process!