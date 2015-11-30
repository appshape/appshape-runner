require 'minitest/autorun'
require 'byebug'
require 'json'

ENV['RUNNER_ENV'] = 'test'

require_relative '../config/application'
require_relative 'support/test_requests_builder'