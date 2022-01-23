class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.integer :customer_id
      t.integer :schedule_id
      t.string :plan_title
      t.date :date
      
      t.timestamps
    end
  end
end
