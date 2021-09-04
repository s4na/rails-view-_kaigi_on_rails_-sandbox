# frozen_string_literal: true

require 'rack'
require 'thin'

class HelloWorld2
  def call(env)
    [200, { 'Content-Type' => 'text/plain' }, env]
  end
end

Rack::Handler::Thin.run HelloWorld2.new
