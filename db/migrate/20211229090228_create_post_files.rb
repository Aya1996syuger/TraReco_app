class CreatePostFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :post_files do |t|
    t.integer "record_id", null: false
    t.string "image_id"


      t.timestamps
    end
  end
end
