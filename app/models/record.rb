class Record < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture
    attachment :image
    belongs_to :itinerary, optional: true
    belongs_to :customer
    belongs_to :genre
    has_many :post_files, dependent: :destroy
    accepts_attachments_for :post_files, attachment: :image
    
    
  
    
end
