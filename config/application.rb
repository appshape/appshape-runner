require 'bundler'
Bundler.require

ENV['RUNNER_ENV'] ||= 'development'

Dotenv.load

require_relative '../models/test'
require_relative '../models/request'
require_relative '../services/test_runner'