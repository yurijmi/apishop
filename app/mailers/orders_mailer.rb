class OrdersMailer < ApplicationMailer
  def new_order_email
    @order = Order.find(params[:id])
    
    mail(to: @order.user.email, subject: 'New order placed')
  end
end
