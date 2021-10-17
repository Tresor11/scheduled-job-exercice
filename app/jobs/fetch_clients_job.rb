class FetchClientsJob < ApplicationJob
  queue_as :default

  def perform
    # Do something later
    ikiz = Ikizmet.new
    data = ikiz.clients_info.handled_response["data"]
    puts "===============Running Job A=================="
    puts "===================#{data}====================="
  end
end
