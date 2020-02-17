class SelectedItem < ApplicationRecord
  belongs_to :item, class_name: 'AccessoryItem', foreign_key: 'accessory_item_id'
  
  belongs_to :cart,  optional: true
  belongs_to :order, optional: true
  
  validates :price_cents, presence: true, numericality: { greater_than: 0 }
  validates :quantity,    presence: true, numericality: { greater_than: 0 }
  
  # validate :cart_xor_order
  validate :quantity_based_on_stock
  
  before_validation :set_price_from_item
  
  def total_price_cents
    self.quantity * self.price_cents
  end
  
private
  
  def cart_xor_order
    unless cart.blank? ^ order.blank?
      errors.add(:base, 'Specify cart or order, not both')
    end
  end
  
  # Validates that quantity does not exceed what's available in stock
  def quantity_based_on_stock
    if self.quantity > self.item.stock
      errors.add(:quantity, "should not exceed what's available in stock")
    end
  end
  
  # Synchronizes price_cents with AccessoryItem's price_cents
  def set_price_from_item
    self.price_cents = self.item.price_cents if self.price_cents.blank?
  end
end
