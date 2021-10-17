class CreateClientsJob < ApplicationJob
  queue_as :default

  def perform(clients)
    clients.each do |client|
      Client.create(client)
    end
  end
end
