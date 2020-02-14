class User < ApplicationRecord
  has_secure_password
  
  has_one :cart, dependent: :destroy
  has_many :orders
  
  validates :email, presence: true, uniqueness: true
  
  before_save :downcase_fields
  
  # Finds a User for Knock auth controller
  def from_token_request(request)
    find_by email: request[:email].downcase
  end
  
  # Creating a cart if User has none
  def cart
    super || Cart.create(user_id: self.id)
  end
  
private
  
  def downcase_fields
    email.downcase!
  end
end
