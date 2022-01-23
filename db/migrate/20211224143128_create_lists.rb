class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.integer :customer_id
      t.integer :genre_id
      t.integer :prefecture_id
      t.string :spot_name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.boolean :check_box, default: true
      


      t.timestamps
    end
  end
end
