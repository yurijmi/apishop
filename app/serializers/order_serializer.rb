class OrderSerializer < ActiveModel::Serializer
  attributes :id, :selected_items, :status, :address, :total_cents, :created_at
  
  has_many :selected_items
end
