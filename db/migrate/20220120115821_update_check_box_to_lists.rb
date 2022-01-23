class UpdateCheckBoxToLists < ActiveRecord::Migration[5.2]
  def change
    change_column_default :lists, :check_box, from: true, to: false
  end
end
