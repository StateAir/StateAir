class StateAir
  class << self

    def latest(id, &block)
      client.get(id) do |result|
        if result.success?
          block.call result.object if block
          # p (result.operation || result.task) # depending on your client
        elsif result.failure?
          # p result.error.localizedDescription
        end
      end
    end

    def client
      @client ||= AFMotion::SessionClient.build("https://state-air.herokuapp.com/state_air/feed/") do
        session_configuration :default

        header "Accept", "application/json"

        response_serializer :json
      end
    end

  end
end
