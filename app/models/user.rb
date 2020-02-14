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
  
private
  
  def downcase_fields
    email.downcase!
  end
end
