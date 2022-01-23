class AddAddressToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :address, :string
  end
end
