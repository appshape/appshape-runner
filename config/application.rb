require 'bundler'
Bundler.require

ENV['RUNNER_ENV'] ||= 'development'

Dotenv.load