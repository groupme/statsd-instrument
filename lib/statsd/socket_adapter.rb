require 'socket'

module StatsD
  class SocketAdapter
    def initialize(host, port)
      @host, @port = host, port.to_i

      if defined?(EventMachine) && EventMachine.reactor_running?
        require 'statsd/udp_client'
        @socket = EventMachine.open_datagram_socket '0.0.0.0', 0, StatsD::UDPClient
      else
        @socket = UDPSocket.new
      end
    end

    def send(data)
      if defined?(EventMachine) && EventMachine.reactor_running?
        @socket.send(data, @host, @port)
      else
        @socket.send(data, 0, @host, @port)
      end
    end
  end
end
