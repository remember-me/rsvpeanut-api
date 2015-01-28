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

ActiveRecord::Schema.define(version: 20150128160614) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_itineraries", force: :cascade do |t|
    t.integer  "intinerary_id"
    t.integer  "event_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "event_itineraries", ["event_id"], name: "index_event_itineraries_on_event_id", using: :btree
  add_index "event_itineraries", ["intinerary_id"], name: "index_event_itineraries_on_intinerary_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "event_type"
    t.string   "location"
    t.datetime "event_start"
    t.datetime "event_end"
    t.integer  "attendees"
    t.float    "cost"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "description"
    t.string   "event_url"
    t.string   "source"
    t.string   "lat"
    t.string   "long"

  end

  create_table "intineraries", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "intineraries", ["event_id"], name: "index_intineraries_on_event_id", using: :btree
  add_index "intineraries", ["user_id"], name: "index_intineraries_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "event_itineraries", "events"
  add_foreign_key "event_itineraries", "intineraries"
  add_foreign_key "intineraries", "events"
  add_foreign_key "intineraries", "users"
end
