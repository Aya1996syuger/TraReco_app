class Record < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture
    attachment :image
    belongs_to :itinerary, optional: true
    belongs_to :customer
    belongs_to :genre
    has_many :post_files, dependent: :destroy
    accepts_attachments_for :post_files, attachment: :image
    
    
  #バリデーション
    validates :prefecture, presence: true
    validates :body, presence: true
    validates :title, presence: true
    validates :record_date, presence: true
    validate :post_file_length
   private
   
   def post_file_length
        if post_files.length > 4
            errors.add(:post_files, "は4枚以内にしてください")
        end
   end

   
    
end
