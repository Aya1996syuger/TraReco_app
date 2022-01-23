class AddAddressToLists < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :address, :string
    add_column :lists, :latitude, :float
    add_column :lists, :longitude, :float
  end
end
