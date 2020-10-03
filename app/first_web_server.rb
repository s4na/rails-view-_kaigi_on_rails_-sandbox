require 'socket'

port = 3000
server = TCPServer.open(port)

socket = server.accept

loop do
  line = socket.readline.chomp
  puts "Read: #{line}"
  break if line.bytesize == 0
end
