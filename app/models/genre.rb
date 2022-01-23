class Genre < ApplicationRecord
 has_many :lists, dependent: :destroy
 has_many :records, dependent: :destroy
 has_many :schedules, dependent: :destroy
 belongs_to :customer
end

