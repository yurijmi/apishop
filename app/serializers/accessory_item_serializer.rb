class AccessoryItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price_cents, :stock
  
  belongs_to :category
  
  class ItemCategorySerializer < ActiveModel::Serializer
    attributes :id, :name
  end
end
