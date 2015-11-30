require 'bundler'
Bundler.require

ENV['RUNNER_ENV'] ||= 'development'

Dotenv.load

#models
require_relative '../app/models/assertion'
require_relative '../app/models/data_point'
require_relative '../app/models/request'
require_relative '../app/models/test'

# services
require_relative '../app/services/assertion_tester'
require_relative '../app/services/condition_factory'
require_relative '../app/services/data_point_collector'
require_relative '../app/services/extractor_factory'
require_relative '../app/services/request_builder'
require_relative '../app/services/request_executor'
require_relative '../app/services/test_runner'

# extractors
require_relative '../app/extractors/base'
require_relative '../app/extractors/header'
require_relative '../app/extractors/json'
require_relative '../app/extractors/response_time'
require_relative '../app/extractors/status_code'
require_relative '../app/extractors/text'
require_relative '../app/extractors/xml'

#consitions
require_relative '../app/conditions/base'
require_relative '../app/conditions/contain'
require_relative '../app/conditions/empty'
require_relative '../app/conditions/equal'
require_relative '../app/conditions/greater_than'
require_relative '../app/conditions/greater_than_or_equal'
require_relative '../app/conditions/has_key'
require_relative '../app/conditions/has_value'
require_relative '../app/conditions/is_null'
require_relative '../app/conditions/less_than'
require_relative '../app/conditions/less_than_or_equal'
require_relative '../app/conditions/not_contain'
require_relative '../app/conditions/not_empty'
require_relative '../app/conditions/not_equal'