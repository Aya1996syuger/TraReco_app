class AddImageToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :image_id, :string
  end
end
