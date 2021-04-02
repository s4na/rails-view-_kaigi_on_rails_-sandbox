require_relative 'my_server.rb'
require_relative 'my_client.rb'

server = MyServer.new

Thread.new do
  server.start
end

# Otherwise, get connection refused error because client sends
# data to server before server creates the client socket
sleep 1

client = MyClient.new
greeting = client.recv_data
puts greeting

client.send_data("hello")
response = client.recv_data
puts response

client.socket.close
server.server_socket.close
server.client.close
