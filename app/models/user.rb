class User < ActiveRecord::Base
  has_many :combos
  has_many :moves, through: :combos
 
  has_secure_password


  validates :password_digest, :email, presence: true
  validates :email, uniqueness: true
end