class Combo < ActiveRecord::Base
  belongs_to :user
  has_many :moves

  validates :name, presence: true
  validates :name, uniqueness: true

end