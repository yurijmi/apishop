class ItemCategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :item_count
end
