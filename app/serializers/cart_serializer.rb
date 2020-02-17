class CartSerializer < ActiveModel::Serializer
  attributes :selected_items, :total_price_cents
  
  has_many :selected_items
end
