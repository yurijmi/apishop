class SelectedItem < ApplicationRecord
  belongs_to :item, class_name: 'AccessoryItem', foreign_key: 'accessory_item_id'
  
  belongs_to :cart,  optional: true
  belongs_to :order, optional: true
  
  validates :price_cents, presence: true, numericality: { greater_than: 0 }
  validates :quantity,    presence: true, numericality: { greater_than: 0 }
  
  validate :cart_id_xor_order_id
  
private
  
  def cart_id_xor_order_id
    unless cart_id.blank? ^ order_id.blank?
      errors.add(:base, 'Specify cart or order, not both')
    end
  end
end
