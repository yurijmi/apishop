class CreateSelectedItems < ActiveRecord::Migration[6.0]
  def change
    create_table :selected_items do |t|
      t.references :accessory_item, null: false, foreign_key: true
      
      t.references :cart,  foreign_key: true
      t.references :order, foreign_key: true
      
      t.integer :price_cents, null: false
      t.integer :quantity,    null: false, default: 1
      
      t.timestamps
    end
  end
end
