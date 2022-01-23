class Plan < ApplicationRecord
    belongs_to :customer, optional:true
    has_many :schedules, dependent: :destroy
end
