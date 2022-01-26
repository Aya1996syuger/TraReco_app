class Schedule < ApplicationRecord
     belongs_to :plan
     belongs_to :genre
     
      #バリデーション
    validates :plan_title, presence: true
    validates :start_time, presence: true
    validates :finish_time, presence: true
    validates :genre, presence: true

    
end
