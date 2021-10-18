class FetchClientsJob < ApplicationJob
  queue_as :default

  def perform
    # Do something later
    ikiz = Ikizmet.new
    clients = ikiz.clients_info.handled_response["data"]

    CreateClientsJob.set(wait: 1.minute).perform_later(clients)
  end
end
