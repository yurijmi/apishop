class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.references :user, null: false, foreign_key: true
      
      t.integer :items_count, null: false, default: 0
      
      t.timestamps
    end
  end
end
