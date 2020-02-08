class ItemCategory < ApplicationRecord
  has_many :items, class_name: 'AccessoryItem'
  
  validates :name,        presence: true, uniqueness: true
  validates :description, presence: true
end
