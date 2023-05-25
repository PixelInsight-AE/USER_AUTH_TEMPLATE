class User < ApplicationRecord
  # validates_presence_of :username, :email, :password_digest
  # validates_uniqueness_of :username, :email
  # validates :password, length: { minimum: 8 }
  

  has_secure_password

end
