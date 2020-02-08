class CreateAccessoryItems < ActiveRecord::Migration[6.0]
  def change
    create_table :accessory_items do |t|
      t.string  :name,        null: false
      t.text    :description, null: false
      t.integer :price_cents, null: false
      t.integer :stock,       null: false, default: 0
      
      t.references :item_category, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
