# frozen_string_literal: true

require 'rack'
require 'thin'

app = lambda do |_env|
  sleep 3
  [200, { 'Content-Type' => 'text/plain' }, ["Hello World\n"]]
end

class LoggingMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    before = Time.now.to_i
    status, headers, body = @app.call(env)
    after = Time.now.to_i

    log_message = "登り時間 #{before}, 下り時刻 #{after}"
    [status, headers, body << log_message]
  end
end

Rack::Handler::Thin.run LoggingMiddleware.new(app)
