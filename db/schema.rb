# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_10_21_215130) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "catches", force: :cascade do |t|
    t.string "species"
    t.float "weight"
    t.float "length"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "spot_name"
    t.float "latitude"
    t.float "longitude"
    t.string "lure"
    t.string "cloudinary_urls"
    t.index ["user_id"], name: "index_catches_on_user_id"
  end

  create_table "lures", force: :cascade do |t|
    t.string "brand"
    t.string "variety"
    t.string "color"
    t.float "weight"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "catches"
    t.string "lures"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "catches", "users"
end
