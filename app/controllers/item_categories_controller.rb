class ItemCategoriesController < ApplicationController
  before_action :set_item_category, only: [:show, :update, :destroy]
  before_action :authenticate_user, only: [:create, :update, :destroy]
  
  def index
    @item_categories = ItemCategory.all

    paginate json: @item_categories
  end
  
  def show
    render json: @item_category
  end
  
  def create
    @item_category = ItemCategory.new(item_category_params)
    
    authorize @item_category
    
    if @item_category.save
      render json: @item_category, status: :created, location: @item_category
    else
      render json: @item_category.errors, status: :unprocessable_entity
    end
  end
  
  def update
    authorize @item_category
    
    if @item_category.update(item_category_params)
      render json: @item_category
    else
      render json: @item_category.errors, status: :unprocessable_entity
    end
  end
  
  def destroy
    authorize @item_category
    
    @item_category.destroy
  end
  
private
  
  def set_item_category
    @item_category = ItemCategory.find(params[:id])
  end
  
  def item_category_params
    params.require(:item_category).permit(:name, :description)
  end
end
