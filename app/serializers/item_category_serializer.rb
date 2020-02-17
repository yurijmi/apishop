class ItemCategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :items_count
end
