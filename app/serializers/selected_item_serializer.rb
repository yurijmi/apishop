class SelectedItemSerializer < ActiveModel::Serializer
  attributes :item, :quantity, :total_price_cents
  
  def item
    AccessoryItemSerializer.new(object.item, root: false)
  end
end
