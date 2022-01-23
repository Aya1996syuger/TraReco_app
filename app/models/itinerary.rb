class Itinerary < ApplicationRecord
     belongs_to :customer
     has_many :records, dependent: :destroy
     has_many :plans, dependent: :destroy
     attachment :image
end
