ENV['APPLICATION_ENV'] ||= 'development'

require 'bundler'
Bundler.require(:default, ENV['APPLICATION_ENV'])

require 'active_support/core_ext/string'

Dotenv.load

load File.expand_path('../../app/logger.rb', __FILE__)

#models
load File.expand_path('../../app/models/assertion.rb', __FILE__)
load File.expand_path('../../app/models/assertion.rb', __FILE__)
load File.expand_path('../../app/models/data_point.rb', __FILE__)
load File.expand_path('../../app/models/request.rb', __FILE__)
load File.expand_path('../../app/models/test.rb', __FILE__)

# services
load File.expand_path('../../app/services/assertion_tester.rb', __FILE__)
load File.expand_path('../../app/services/condition_factory.rb', __FILE__)
load File.expand_path('../../app/services/data_point_collector.rb', __FILE__)
load File.expand_path('../../app/services/extractor_factory.rb', __FILE__)
load File.expand_path('../../app/services/request_builder.rb', __FILE__)
load File.expand_path('../../app/services/request_executor.rb', __FILE__)
load File.expand_path('../../app/services/test_runner.rb', __FILE__)
load File.expand_path('../../app/services/response_uploader.rb', __FILE__)

# extractors
load File.expand_path('../../app/extractors/base.rb', __FILE__)
load File.expand_path('../../app/extractors/header.rb', __FILE__)
load File.expand_path('../../app/extractors/json.rb', __FILE__)
load File.expand_path('../../app/extractors/response_time.rb', __FILE__)
load File.expand_path('../../app/extractors/status_code.rb', __FILE__)
load File.expand_path('../../app/extractors/text.rb', __FILE__)
load File.expand_path('../../app/extractors/xml.rb', __FILE__)

#conditions
load File.expand_path('../../app/conditions/base.rb', __FILE__)
load File.expand_path('../../app/conditions/contain.rb', __FILE__)
load File.expand_path('../../app/conditions/empty.rb', __FILE__)
load File.expand_path('../../app/conditions/equal.rb', __FILE__)
load File.expand_path('../../app/conditions/greater_than.rb', __FILE__)
load File.expand_path('../../app/conditions/greater_than_or_equal.rb', __FILE__)
load File.expand_path('../../app/conditions/has_key.rb', __FILE__)
load File.expand_path('../../app/conditions/has_value.rb', __FILE__)
load File.expand_path('../../app/conditions/is_null.rb', __FILE__)
load File.expand_path('../../app/conditions/less_than.rb', __FILE__)
load File.expand_path('../../app/conditions/less_than_or_equal.rb', __FILE__)
load File.expand_path('../../app/conditions/not_contain.rb', __FILE__)
load File.expand_path('../../app/conditions/not_empty.rb', __FILE__)
load File.expand_path('../../app/conditions/not_equal.rb', __FILE__)