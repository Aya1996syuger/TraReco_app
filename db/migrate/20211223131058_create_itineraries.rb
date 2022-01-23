class CreateItineraries < ActiveRecord::Migration[5.2]
  def change
    create_table :itineraries do |t|
      t.integer  :customer_id
      t.string   :itinerary_name
      t.string   :image_id
      t.date     :start_date
      t.date     :finish_date
      

      t.timestamps
    end
  end
end
