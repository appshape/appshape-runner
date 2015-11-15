require "#{File.dirname(__FILE__)}/config/application.rb"
require "#{File.dirname(__FILE__)}/config/slop.rb"

@beanstalk = Beaneater.new(ENV['BEANSTALKD_URL'])
@options[:locations].each do |location|
  @beanstalk.jobs.register("tests-#{location}-queue") do |job|
    test = Test.from_json(JSON.parse(job.body))



  end
end

@beanstalk.jobs.process!