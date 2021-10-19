class CreateSummaries < ActiveRecord::Migration[6.1]
  def change
    create_table :summaries do |t|
      t.references :client, null: false, foreign_key: true
      t.integer :highest
      t.integer :lowest
      t.timestamps
    end
  end
end
