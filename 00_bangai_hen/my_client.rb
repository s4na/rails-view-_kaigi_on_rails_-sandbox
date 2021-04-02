require 'socket'

class MyClient
  attr_reader :socket

  def initialize
    @socket = Socket.new(Socket::AF_INET, Socket::SOCK_STREAM, 0)
    @socket.setsockopt(Socket::SOL_SOCKET, Socket::SO_REUSEADDR, true)
    @socket.connect Socket.pack_sockaddr_in(13_500, '127.0.0.1')
  end

  def send_data(data)
    @socket.puts data
  end

  def recv_data
    @socket.gets
  end
end
