require 'sinatra/base'
require 'sinatra/json'

module AppShapeRunner
  class Server < Sinatra::Base
    set :environment, :test
    disable :logging
    disable :protection

    [:get, :post, :put, :patch, :delete, :options].each do |method|
      send(method, '/echo') do
        output = {
          http_method: request.request_method.downcase,
          query_string_params: request.GET,
          form_params: request.POST,
          headers: Hash[env.select { |k,v| k.start_with?('HTTP_') }.map { |k,v| [k.sub(/^HTTP_/, ''), v] }],
          content_type: request.content_type,
          body: request.body.read
        }

        json output
      end
    end

    error do |e|
      "#{e.class}\n#{e.to_s}\n#{e.backtrace.join("\n")}"
    end

    def self.server_settings
      { AccessLog: [], Logger: WEBrick::Log::new('/dev/null', 7) }
    end
  end
end

AppShapeRunner::Server.run!