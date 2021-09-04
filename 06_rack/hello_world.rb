# frozen_string_literal: true

require 'rack'
require 'thin'

# https://thoughtbot.com/upcase/videos/rack を参考に作成
class HelloWorld
  def call(_env)
    [200, { 'Content-Type' => 'text/plain' }, ['Hello World']]
  end
end

Rack::Handler::Thin.run HelloWorld.new
