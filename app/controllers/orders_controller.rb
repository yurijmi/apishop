class OrdersController < ApplicationController
  before_action :authenticate_user
  
  def index
    paginate json: current_user.orders
  end
  
  def show
    @order = current_user.orders.find(params[:id])
    
    render json: @order
  end
  
  def create
    @order = Order.from_cart(current_user.cart, order_params)
    
    if @order.save
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity, location: orders_url
    end
  end
  
private
  
  def order_params
    params.require(:order).permit(:address)
  end
end
