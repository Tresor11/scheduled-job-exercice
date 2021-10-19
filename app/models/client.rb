class Client < ApplicationRecord

  after_create :create_summary

  has_many :sales
  has_many :summaries
  private

  def create_summary
    CreateSummaryJob.perform_later(self.id)
  end
end
