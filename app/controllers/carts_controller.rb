class CartsController < ApplicationController
  before_action :authenticate_user
  
  def show
    render json: Cart.includes(:selected_items, items: :category).find_by(user_id: current_user.id)
  end
  
  def destroy
    current_user.cart.destroy
  end
end
