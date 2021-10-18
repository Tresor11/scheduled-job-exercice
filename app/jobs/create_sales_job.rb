class CreateSalesJob < ApplicationJob
  queue_as :default

  def perform(sales)
    sales.each do |sale|
      Client.find_by(client_id: sale['client_id']).sales.create(revenue: sale['revenue'])
    end
  end
end
