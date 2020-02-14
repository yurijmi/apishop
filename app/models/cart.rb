class Cart < ApplicationRecord
  belongs_to :user
  
  has_many :selected_items, dependent: :destroy
  has_many :items, through: :selected_items, class_name: 'AccessoryItem', counter_cache: true
  
  # Adds the specified AccessoryItem to Cart
  # 
  # @param [AccessoryItem] item The AccessoryItem to be added into Cart
  # @param [Integer] quantity Amount of said item to add
  # 
  # @return [SelectedItem] The created or updated SelectedItem
  def add_item(item, quantity = 1)
    if self.items.include?(item)
      selected_item = self.selected_items.find_by(accessory_item_id: item)
      selected_item.quantity += quantity
    else
      selected_item = self.selected_items.build
      selected_item.item     = item
      selected_item.quantity = quantity
    end
    
    selected_item.save
    
    selected_item
  end
end
