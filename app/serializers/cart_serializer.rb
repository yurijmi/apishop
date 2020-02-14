class CartSerializer < ActiveModel::Serializer
  has_many :items
end
