class CreateClientsJob < ApplicationJob
  queue_as :default

  def perform(clients)
    Client.upsert_all(clients)
  end
end
