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

ActiveRecord::Schema.define(version: 20180325181513) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bikes", force: :cascade do |t|
    t.string "brand"
    t.string "model"
    t.bigint "station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "broked"
    t.index ["station_id"], name: "index_bikes_on_station_id"
  end

  create_table "slots", force: :cascade do |t|
    t.bigint "station_id"
    t.boolean "available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bike_id"
    t.index ["bike_id"], name: "index_slots_on_bike_id"
    t.index ["station_id"], name: "index_slots_on_station_id"
  end

  create_table "stations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.string "origin_station"
    t.string "final_station"
    t.datetime "start_date"
    t.datetime "end_date"
    t.float "distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bike_id"
    t.bigint "user_id"
    t.string "state"
    t.index ["bike_id"], name: "index_trips_on_bike_id"
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authentication_token", limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bikes", "stations"
  add_foreign_key "slots", "bikes"
  add_foreign_key "slots", "stations"
  add_foreign_key "trips", "bikes"
  add_foreign_key "trips", "users"
end
