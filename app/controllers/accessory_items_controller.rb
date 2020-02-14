class AccessoryItemsController < ApplicationController
  before_action :set_accessory_item, only: :show
  
  def index
    @category = ItemCategory.find(params[:category_id]) if params[:category_id]
    @accessory_items = @category ? @category.items : AccessoryItem.all
    
    paginate json: @accessory_items
  end
  
  def show
    render json: @accessory_item
  end
  
private
  
  def set_accessory_item
    @accessory_item = AccessoryItem.find(params[:id])
  end
end
