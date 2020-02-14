class CartsController < ApplicationController
  before_action :authenticate_user
  before_action :set_cart
  
  def show
    render json: @cart
  end
  
  def destroy
    @cart.destroy
  end
  
private
  
  def set_cart
    @cart = current_user.cart
  end
end
