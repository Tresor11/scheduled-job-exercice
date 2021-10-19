class CreateSummaryJob < ApplicationJob
  queue_as :default

  def perform(id)
    #join the client table to sale table and get the lowest revenue for client
    lowest = Sale.where(client_id: id).order(:revenue).first
    highest = Sale.where(client_id: id).order(:revenue).last
    #create a summary for the client
    Summary.create(client_id: id, lowest: lowest.revenue, highest: highest.revenue)
  end
end
