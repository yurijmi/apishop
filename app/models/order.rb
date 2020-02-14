class Order < ApplicationRecord
  belongs_to :user
  
  has_many :selected_items, dependent: :destroy, counter_cache: :items_count
  has_many :items, through: :selected_items, class_name: 'AccessoryItem'
end
