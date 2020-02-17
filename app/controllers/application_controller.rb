class ApplicationController < ActionController::API
  include Knock::Authenticable
  include Pundit
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
private
  
  def user_not_authorized
    render json: { error: 'you are not authorized for this action' }, status: :forbidden
  end
end
