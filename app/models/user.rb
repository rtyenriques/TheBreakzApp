class User < ActiveRecord::Base
  has_many :combos
  has_secure_password
end