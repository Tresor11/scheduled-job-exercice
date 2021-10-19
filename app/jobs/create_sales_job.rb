class CreateSalesJob < ApplicationJob
  queue_as :default

  def perform(sales)
    Sale.update_all(sales.map {|sale|
        {revenue: sale['revenue'], user_id: User.find_by(user_id: sale['user_id'])}
      }
    )
  end
end
