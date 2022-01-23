class PostFile < ApplicationRecord
    belongs_to :record
    attachment :image
  
  
  
end
