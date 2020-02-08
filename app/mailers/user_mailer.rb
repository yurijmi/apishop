class UserMailer < ApplicationMailer
  def registration_email
    @user = User.find(params[:user_id])
    
    # I don't think this is a good idea to include the password in the email.
    # It could be transferred as clear text over the network
    @password = params[:password]
    
    mail(to: @user.email, subject: 'Welcome to API Shop test app!')
  end
end
