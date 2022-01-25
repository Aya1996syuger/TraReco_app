# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_20_115821) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "gender", default: 0, null: false
    t.integer "integew", default: 0, null: false
    t.string "name"
    t.string "birthplace"
    t.date "birthday"
    t.boolean "is_active", default: true
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "genres", force: :cascade do |t|
    t.integer "customer_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "itineraries", force: :cascade do |t|
    t.integer "customer_id"
    t.string "itinerary_name"
    t.string "image_id"
    t.date "start_date"
    t.date "finish_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lists", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "genre_id"
    t.integer "prefecture_id"
    t.string "spot_name"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.boolean "check_box", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plans", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "schedule_id"
    t.string "plan_title"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_time"
    t.datetime "finish_time"
    t.string "address"
  end

  create_table "post_files", force: :cascade do |t|
    t.integer "record_id", null: false
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "records", force: :cascade do |t|
    t.integer "itinerary_id"
    t.integer "genre_id"
    t.integer "prefecture_id"
    t.integer "customer_id"
    t.date "record_date"
    t.string "image_id"
    t.string "title"
    t.string "price"
    t.string "member"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "follow_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id", "follow_id"], name: "index_relationships_on_customer_id_and_follow_id", unique: true
    t.index ["customer_id"], name: "index_relationships_on_customer_id"
    t.index ["follow_id"], name: "index_relationships_on_follow_id"
  end

  create_table "schedules", force: :cascade do |t|
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
  end

  create_table "shares", force: :cascade do |t|
    t.integer "record_id"
    t.integer "genre_id"
    t.integer "prefecture_id"
    t.date "record_date"
    t.string "image_id"
    t.string "title"
    t.string "price"
    t.string "member"
    t.string "range"
    t.string "search"
    t.string "word"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
