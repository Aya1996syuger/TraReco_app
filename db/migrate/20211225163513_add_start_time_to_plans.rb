class AddStartTimeToPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :plans, :start_time, :datetime
    add_column :plans, :finish_time, :datetime
    add_column :plans, :date, :datetime
    add_column :plans, :address, :string
  end
end
