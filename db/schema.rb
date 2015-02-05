# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150205195336) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_itineraries", force: :cascade do |t|
    t.integer  "itinerary_id"
    t.integer  "event_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "event_itineraries", ["event_id"], name: "index_event_itineraries_on_event_id", using: :btree
  add_index "event_itineraries", ["itinerary_id"], name: "index_event_itineraries_on_itinerary_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "event_type"
    t.string   "location"
    t.datetime "utc_start"
    t.datetime "utc_end"
    t.integer  "attendees"
    t.float    "cost"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "description"
    t.string   "lat"
    t.string   "long"
    t.string   "event_url"
    t.string   "source"
    t.string   "date_start"
    t.string   "date_end"
    t.string   "time_start"
    t.string   "time_end"
    t.string   "venue"
  end

  create_table "itineraries", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "itineraries", ["user_id"], name: "index_itineraries_on_user_id", using: :btree

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "first"
    t.string   "last"
    t.string   "email"
  end

  add_foreign_key "event_itineraries", "events"
  add_foreign_key "event_itineraries", "itineraries"
  add_foreign_key "itineraries", "users"
end
