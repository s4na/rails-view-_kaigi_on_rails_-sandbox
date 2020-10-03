require 'socket'

port = 3000
server = TCPServer.open(port)

loop do
  # Wait for connection
  socket = server.accept

  puts 'Got a connection!'

  if match = socket.gets.chomp.match(/^(?<verb>[A-Z]*) (?<path>[^ ]*) (?<ver>.*)$/)
    headers = []
    while line = socket.gets.chomp
      break if line.bytesize.zero?

      headers << line.split(': ')
    end
    p VERB: match[:verb]
    p PATH: match[:path]
    p VERSION: match[:ver]
    p HEDERS: headers
  end

  next unless line.bytesize.zero?

  socket.write "HTTP/1.1 200 OK\r\n"
  socket.write "\r\n"
  socket.write "Hello World\r\n"
  socket.close
end
