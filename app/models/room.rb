class Room < ApplicationRecord
    belongs_to :user, foreign_key: "user_id"
    has_many :reservations

    has_one_attached :image
    
end
