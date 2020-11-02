require 'socket'
require_relative 'application'
require_relative 'rack/timer'

port = 3000
server = TCPServer.open(port)

loop do
  # Wait for connection
  socket = server.accept

  puts 'Got a connection!'

  if match = socket.gets.chomp.match(/^(?<verb>[A-Z]*) (?<path>[^ ]*) (?<ver>.*)$/)
    # Make a hash with the request information
    env = {
      'REQUEST_METHOD' => match[:verb],
      'PATH_INFO' => match[:path],
      'HTTP_VERSION' => match[:ver]
    }

    while line = socket.gets.chomp
      break if line.bytesize.zero?

      key, value = line.split(': ')
      env[key] = value
    end

    # debug
    p 'env'
    pp env

    # Call app with request information
    app = Application.new
    # response = app.call(env)
    timer = Rack::Timer.new(app)
    response = timer.call(env)

    # debug
    # Application#call の戻り値に含まれていないため、
    # responseにheadersは含まれていない。
    p 'response'
    pp response

    status = response[0]
    headers = response[1]
    body = response[2]

    socket.write "HTTP/1.1 #{status} OK\r\n"

    # debug
    p 'headers'
    pp headers

    headers.each do |key, value|
      socket.write "#{key}: #{value}"
    end

    socket.write "\r\n"

    body.each { |part| socket.write part }
  end
  socket.close
end
