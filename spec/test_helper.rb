require 'minitest/autorun'
require 'json'

ENV['APPLICATION_ENV'] = 'test'

require_relative '../config/application'
require_relative 'support/test_requests_builder'