class Plan < ApplicationRecord
    belongs_to :customer, optional:true
    has_many :schedules, dependent: :destroy
    
    #バリデーション
    validates :plan_title, presence: true
    validates :date, presence: true
  
end
