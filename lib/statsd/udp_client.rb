module StatsD
  class UDPClient < EM::Connection
    include EM::Deferrable

    def post_init
      succeed
    end

    def send(data, host, port)
      callback {
        send_datagram data, host, port
      }
    end
  end
end
