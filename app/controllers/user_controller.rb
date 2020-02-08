class UserController < ApplicationController
  before_action :authenticate_user, only: :show
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      UserMailer.with(user_id: @user.id, password: user_params[:password]).registration_email.deliver_later
      
      render json: @user, status: :created, location: user_url
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  
  def show
    render json: current_user
  end
  
private
  
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
