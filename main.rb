require "#{File.dirname(__FILE__)}/config/application.rb"
require "#{File.dirname(__FILE__)}/config/slop.rb"

@beanstalk = Beaneater.new(ENV['BEANSTALKD_URL'])
@options[:locations].each do |location|
  @beanstalk.jobs.register("tests-#{location}-queue") do |job|
    puts job
  end
end

@beanstalk.jobs.process!