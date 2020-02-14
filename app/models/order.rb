class Order < ApplicationRecord
  belongs_to :user
  
  has_many :selected_items, dependent: :destroy
  has_many :items, through: :selected_items, class_name: 'AccessoryItem', counter_cache: true
end
