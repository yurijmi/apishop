class AccessoryItem < ApplicationRecord
  belongs_to :category, class_name: 'ItemCategory', foreign_key: 'item_category_id'
  
  validates :name,        presence: true
  validates :description, presence: true
  validates :price_cents, presence: true, numericality: { greater_than: 0 }
  validates :stock,       presence: true, numericality: { greater_than_or_equal_to: 0 }
end
