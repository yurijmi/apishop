class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      
      t.text :address, null: false
      
      t.integer :status,      null: false, default: 0
      t.integer :items_count, null: false, default: 0
      t.integer :total_cents, null: false, default: 0

      t.timestamps
    end
  end
end
