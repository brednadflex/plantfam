# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_01_125257) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "provider_id", null: false
    t.string "service_type"
    t.date "start_date"
    t.date "end_date"
    t.boolean "confirmed", default: false, null: false
    t.boolean "completed", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_bookings_on_client_id"
    t.index ["provider_id"], name: "index_bookings_on_provider_id"
  end

  create_table "chat_rooms", force: :cascade do |t|
    t.bigint "booking_id"
    t.bigint "requester_id", null: false
    t.bigint "receiver_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_id"], name: "index_chat_rooms_on_booking_id"
    t.index ["receiver_id"], name: "index_chat_rooms_on_receiver_id"
    t.index ["requester_id"], name: "index_chat_rooms_on_requester_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "chat_room_id", null: false
    t.text "content"
    t.date "date"
    t.time "time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chat_room_id"], name: "index_messages_on_chat_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.text "description"
    t.string "profile_img"
    t.string "banner_img"
    t.string "experience"
    t.float "avg_rating"
    t.string "address"
    t.float "location_lat"
    t.float "location_lng"
    t.float "max_radius"
    t.boolean "sitter", default: false
    t.boolean "advisor", default: false
    t.boolean "public", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "booking_id", null: false
    t.bigint "user_id", null: false
    t.text "content"
    t.float "rating"
    t.boolean "recommended", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "users", column: "client_id"
  add_foreign_key "bookings", "users", column: "provider_id"
  add_foreign_key "chat_rooms", "bookings"
  add_foreign_key "chat_rooms", "users", column: "receiver_id"
  add_foreign_key "chat_rooms", "users", column: "requester_id"
  add_foreign_key "messages", "chat_rooms"
  add_foreign_key "messages", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "reviews", "bookings"
  add_foreign_key "reviews", "users"
end
