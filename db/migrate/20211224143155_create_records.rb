class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.integer :itinerary_id
      t.integer :genre_id
      t.integer :prefecture_id
      t.integer :customer_id
      t.date :record_date
      t.string :image_id
      t.string :title
      t.string :price
      t.string :member
      t.text :body
      
     
      
      t.timestamps
    end
  end
end
