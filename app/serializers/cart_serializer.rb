class CartSerializer < ActiveModel::Serializer
  has_many :selected_items
end
