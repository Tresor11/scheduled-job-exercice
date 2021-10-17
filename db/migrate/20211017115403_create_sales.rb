class CreateSales < ActiveRecord::Migration[6.1]
  def change
    create_table :sales do |t|
      t.integer :revenue
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
