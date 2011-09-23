require 'socket'

module StatsD
  class SocketAdapter
    def initialize(host, port)
      @host, @port = host, port.to_i
    end

    def send(data)
      if defined?(EventMachine) && EventMachine.reactor_running?
        socket = EventMachine.open_datagram_socket '0.0.0.0', 0
        socket.send_datagram data, @host, @port
        socket.close_connection_after_writing
      else
        @socket ||= UDPSocket.new
        @socket.send(data, 0, @host, @port)
      end
    end
  end
end
