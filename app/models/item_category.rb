class ItemCategory < ApplicationRecord
  has_many :items, class_name: 'AccessoryItem', counter_cache: :items_count
  
  validates :name,        presence: true, uniqueness: true
  validates :description, presence: true
end
