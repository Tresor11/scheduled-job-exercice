class FetchRevenuesJob < ApplicationJob
  queue_as :default

  def perform
    ikiz = Ikizmet.new
    sales = ikiz.clients_sales.handled_response["data"]

    CreateSalesJob.set(wait: 1.minute).perform_later(sales)
  end
end
