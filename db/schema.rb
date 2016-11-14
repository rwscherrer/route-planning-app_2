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

ActiveRecord::Schema.define(version: 20161106164036) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carted_products", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.integer  "job_id"
    t.string   "status"
    t.integer  "order_id"
    t.integer  "priority"
    t.float    "job_duration"
    t.boolean  "in_progress"
    t.integer  "row_order"
  end

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "category"
    t.integer  "importance"
  end

  create_table "jobs", force: :cascade do |t|
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "name"
    t.string   "address_1"
    t.string   "phone_number"
    t.string   "email"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "user_id",           default: 1
    t.datetime "last_service_date"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "in_progress"
    t.float    "duration"
  end

  create_table "jobs_categories", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "job_id"
    t.integer  "category_id"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "places", force: :cascade do |t|
    t.string   "title"
    t.string   "address"
    t.string   "text"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "visited_by"
    t.integer  "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
