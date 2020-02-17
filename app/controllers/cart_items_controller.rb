class CartItemsController < ApplicationController
  before_action :authenticate_user
  before_action :set_cart_item, only: [:update, :destroy]
  
  def create
    item = AccessoryItem.find(params[:id])
    quantity = params[:quantity] ? params[:quantity].to_i : 1
    
    @cart_item = current_user.cart.add_item(item, quantity)
    
    if @cart_item.changed?
      render json: @cart_item.errors, status: :unprocessable_entity, location: cart_url
    else
      render json: current_user.cart, status: :created, location: cart_url
    end
  end
  
  def update
    @cart_item.quantity = params[:quantity].to_i
    
    # Removing item from cart if it's quantity less than 1
    if @cart_item.quantity < 1
      @cart_item.destroy
      
      render json: current_user.cart, status: :accepted, location: cart_url
    end
    
    if @cart_item.save
      render json: current_user.cart, status: :accepted, location: cart_url
    else
      render json: @cart_item.errors, status: :unprocessable_entity, location: cart_url
    end
  end
  
  def destroy
    @cart_item.destroy
    
    render json: current_user.cart, status: :accepted, location: cart_url
  end
  
private
  
  def set_cart_item
    @cart_item = SelectedItem.find_by(cart_id: current_user.cart, accessory_item_id: params[:id])
  end
end
