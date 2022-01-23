class CreateShares < ActiveRecord::Migration[5.2]
  def change
    create_table :shares do |t|
    t.integer :record_id
    t.integer :genre_id
    t.integer :prefecture_id
    t.date :record_date
    t.string :image_id
    t.string :title
    t.string :price
    t.string :member
    t.string :range
    t.string :search
    t.string :word
    t.text :body

      t.timestamps
    end
  end
end
