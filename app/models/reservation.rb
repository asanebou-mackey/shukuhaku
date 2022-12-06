class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :room

    #バリデーションエラーメッセージ
    validates :start, presence: true
    validates :end, presence: true
    validates :number, presence: true
end
