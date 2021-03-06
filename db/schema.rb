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

ActiveRecord::Schema.define(version: 2020_12_10_114428) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "planets", force: :cascade do |t|
    t.string "name"
    t.integer "size"
    t.boolean "fuel_present"
    t.boolean "fuel_constructed"
    t.text "image"
    t.integer "system_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "sensors_detected"
    t.boolean "sensors_investigated"
    t.datetime "mine_time"
  end

  create_table "ships", force: :cascade do |t|
    t.string "name"
    t.integer "fuel"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "systems", force: :cascade do |t|
    t.string "name"
    t.text "image"
    t.integer "user_id"
    t.integer "sys_below_id"
    t.integer "sys_above_id"
    t.integer "sys_left_id"
    t.integer "sys_right_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "time_entered"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "currency"
    t.integer "fuel"
    t.integer "green_crystals"
    t.integer "red_crystals"
    t.integer "blue_crystals"
    t.integer "purple_crystals"
    t.integer "last_system"
  end

end
