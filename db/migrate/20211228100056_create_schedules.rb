class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
    t.integer "itinerary_id"
    t.integer "customer_id"
    t.integer "plan_id"
    t.integer "genre_id"
    t.string "plan_title"
    t.string "genre"
    t.string "budget"
    t.string "address"
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_time"
    t.datetime "finish_time"
    t.datetime "date"

      t.timestamps
    end
  end
end
