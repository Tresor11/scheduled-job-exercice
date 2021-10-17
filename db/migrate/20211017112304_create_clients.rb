class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :client_first_name
      t.string :client_last_name
      t.integer :client_id, limit: 8
      t.timestamps
    end
    add_index :clients, :client_id, unique: true
  end
end
