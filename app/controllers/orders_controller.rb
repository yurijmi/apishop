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
      # Need to reload the Cart or else rails will destroy SelectedItems even though they're no longer associated
      current_user.cart.reload
      current_user.cart.destroy!
      
      OrdersMailer.with(id: @order.id).new_order_email.deliver_later
      
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
