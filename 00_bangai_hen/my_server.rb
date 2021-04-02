require 'socket'

class MyServer
  attr_reader :server_socket, :client, :status

  def initialize
    @server_socket = Socket.new(Socket::AF_INET, Socket::SOCK_STREAM, 0)
    @server_socket.setsockopt(Socket::SOL_SOCKET, Socket::SO_REUSEADDR, true)

    sockaddr = Socket.pack_sockaddr_in(13_500, '127.0.0.1')
    @server_socket.bind(sockaddr)
    @server_socket.listen(5)
    @status = 'initialize'
  end

  def start
    # Blocks and waits for client connections:
    @client, client_sockaddr = @server_socket.accept
    # @client.puts "Connected to the server! Press q to exit"

    loop do # loop() automatically catches a StopIteration exception and terminates
      data = @client.recvfrom(1024)[0].chomp
      handle_data(data)

      @status = 'run'
      p 'MyServer#start loop中'
      p "MyServer#start @status => #{@status}"
    end
  end

  def handle_data(data)
    response = ''

    case data
    when 'q', ''
      # terminates loop()
      raise StopIteration
    else
      # For some reason @client can be nil here
      # which causes a nil.puts error two lines down.
      if @client
        response = data
        @client.puts response
      end
    end

    response
  end
end
