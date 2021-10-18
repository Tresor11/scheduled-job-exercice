class FetchRevenuesJob < ApplicationJob
  queue_as :default

  def perform
    # Do something later
    ikiz = Ikizmet.new
    sales = ikiz.clients_sales.handled_response["data"]

    CreateSalesJob.set(wait: 1.minute).perform_later(sales)
  end
end
