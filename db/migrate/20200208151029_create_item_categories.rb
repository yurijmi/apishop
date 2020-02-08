class CreateItemCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :item_categories do |t|
      t.string  :name,        null: false
      t.string  :description, null: false
      t.integer :item_count,  null: false, default: 0

      t.timestamps
    end
    
    add_index :item_categories, :name, unique: true
  end
end
