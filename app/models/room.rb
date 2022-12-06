class Room < ApplicationRecord
    belongs_to :user, foreign_key: "user_id"
    has_many :reservations

    has_one_attached :image

    #バリデーションエラーメッセージ
    validates :name, presence: true
    validates :introduce, presence: true
    validates :price, presence: true
    validates :address, presence: true
    validates :image, presence: true

end
