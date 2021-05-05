class Move < ActiveRecord::Base
    belongs_to :combo
    belongs_to :user
    

    validates :move_name, presence: true

end