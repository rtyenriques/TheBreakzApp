class Combo < ActiveRecord::Base
  belongs_to :user
  has_many :moves

end