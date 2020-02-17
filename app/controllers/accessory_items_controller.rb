class AccessoryItemsController < ApplicationController
  before_action :set_accessory_item, only: [:show, :update, :destroy]
  before_action :authenticate_user, only: [:create, :update, :destroy]
  
  def index
    @category = ItemCategory.find(params[:category_id]) if params[:category_id]
    @accessory_items = @category ? @category.items : AccessoryItem.all
    
    paginate json: @accessory_items.includes(:category)
  end
  
  def show
    render json: @accessory_item
  end
  
  def create
    @accessory_item = AccessoryItem.new(accessory_item_params)
    
    authorize @accessory_item
    
    if @accessory_item.save
      render json: @accessory_item, status: :created, location: item_url(@accessory_item)
    else
      render json: @accessory_item.errors, status: :unprocessable_entity
    end
  end
  
  def update
    authorize @accessory_item
    
    if @accessory_item.update(accessory_item_params)
      render json: @accessory_item
    else
      render json: @accessory_item.errors, status: :unprocessable_entity
    end
  end
  
  def destroy
    authorize @accessory_item
    
    @accessory_item.destroy
  end
  
private
  
  def set_accessory_item
    @accessory_item = AccessoryItem.find(params[:id])
  end
  
  def accessory_item_params
    params.require(:accessory_item).permit(:name, :description, :price_cents, :stock, :item_category_id)
  end
end
