class List < ApplicationRecord
 extend ActiveHash::Associations::ActiveRecordExtensions
  
 belongs_to_active_hash :prefecture
 
 belongs_to :genre
 belongs_to :customer
 
 geocoded_by :address
 after_validation :geocode, if: :address_changed?
 
 #バリデーション
    validates :prefecture, presence: true
    validates :spot_name, presence: true
    validates :address, presence: true
end

