# frozen_string_literal: true

require_relative 'my_server'
require_relative 'my_client'

RSpec.describe 'MyServer' do
  before do
    @server = MyServer.new

    Thread.new do
      @server.start
    end

    @client = MyClient.new
    @data = 'hello'
    # Make sure server has started before doing this.
    @client.send_data(@data)

    sleep 1 while @server.status != 'run'
  end

  after do
    # Will send nil to client, causing gets() to unblock,
    # allowing recv_data() to finish executing.
    @server.server_socket.close
    @server.client.close
    @client.socket.close
  end

  describe '#handle_data' do
    context 'given a string' do
      it 'returns reversed string' do
        expect(@server.handle_data(@data)).to eql(@data)
      end
    end
  end

  describe '- client receives correct response' do
    context 'given a string' do
      it 'returns reversed string' do
        expect(@client.recv_data).to eql("#{@data}\n")
      end
    end
  end
end
