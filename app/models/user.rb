class User < ApplicationRecord
  has_secure_password
  
  validates :email, presence: true, uniqueness: true
  
  before_save :downcase_fields
  
private
  
  def downcase_fields
    email.downcase!
  end
end
