class Itinerary < ApplicationRecord
     belongs_to :customer
     has_many :records, dependent: :destroy
     has_many :plans, dependent: :destroy
     attachment :image
     
     #バリデーション
    validates :itinerary_name, presence: true
    validates :start_date, presence: true
    validates :finish_date, presence: true
    validates :image, presence: true
end
