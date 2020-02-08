class ItemCategoriesController < ApplicationController
  def index
    @item_categories = ItemCategory.all

    paginate json: @item_categories
  end
  
  def show
    @item_category = ItemCategory.find(params[:id])
    
    render json: @item_category
  end
end
