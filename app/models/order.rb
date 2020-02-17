class Order < ApplicationRecord
  belongs_to :user
  
  has_many :selected_items, dependent: :destroy, counter_cache: :items_count
  has_many :items, through: :selected_items, class_name: 'AccessoryItem'
  
  enum status: [:pending, :shipping, :completed]
  
  validates :address, presence: true
  validates :selected_items, length: { minimum: 1, too_short: 'cart is empty' }
  
  # Creates an Order from existing Cart
  # 
  # @param [Cart] cart Cart to create order from
  # @param [Hash] params Parameters for the Order
  # 
  # @return [Order] New Order object
  def self.from_cart(cart, params = {})
    order = Order.new(params)
    order.user_id = cart.user_id
    
    cart.selected_items.each do |item|
      order.selected_items << item
      order.total_cents += item.price_cents
      
      item.cart_id = nil
    end
    
    order
  end
end
