module HostedGraphite
  class FaradayProtocol < Protocol
    def initialize
      super
      @url = API_URI
    end

    def send_message(message)
      conn = Faraday.new do |faraday|
        faraday.request :basic_auth, @api_key, nil
        faraday.adapter Faraday.default_adapter
      end

      conn.post @url, message
    end
  end
end