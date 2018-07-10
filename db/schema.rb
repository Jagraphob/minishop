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

ActiveRecord::Schema.define(version: 2018_07_09_233624) do

  create_table "customers", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "phone_number", null: false
    t.string "card_number", null: false
  end

  create_table "meters", force: :cascade do |t|
    t.integer "property_id"
    t.decimal "reading", precision: 16, scale: 4
    t.integer "decimal_position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_meters_on_property_id"
  end

  create_table "ownerships", force: :cascade do |t|
    t.integer "property_id"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "customer_id"
    t.index ["customer_id"], name: "index_ownerships_on_customer_id"
    t.index ["property_id"], name: "index_ownerships_on_property_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "number", null: false
    t.string "street_name", null: false
    t.string "suburb", null: false
    t.string "city", null: false
    t.string "region", null: false
    t.string "postcode"
    t.string "icp_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "register_serials", force: :cascade do |t|
    t.integer "property_id"
    t.string "meter_number"
    t.string "register_number"
    t.string "register_decimals"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_register_serials_on_property_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.integer "role", default: 0
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "customer_id"
    t.index ["customer_id"], name: "index_users_on_customer_id"
    t.index ["email"], name: "index_users_on_email"
  end

end
