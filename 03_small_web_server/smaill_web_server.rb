require 'socket'

port = 3000
server = TCPServer.open(port)

loop do
  # Wait for connection
  socket = server.accept

  puts 'Got a connection!'

  loop do
    line = socket.readline.chomp
    puts "Read: #{line}"
    next unless line.bytesize.zero?

    socket.write "HTTP/1.1 200 OK\r\n"
    socket.write "\r\n"
    socket.write "Hello World\r\n"
    socket.close
    break
  end
end
