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

ActiveRecord::Schema.define(version: 20150507181014) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "babies", force: :cascade do |t|
    t.string   "name"
    t.datetime "birthday"
    t.string   "gender"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "babies", ["user_id"], name: "index_babies_on_user_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.datetime "date"
    t.string   "topic"
    t.text     "body"
    t.integer  "baby_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "events", ["baby_id"], name: "index_events_on_baby_id", using: :btree

  create_table "media", force: :cascade do |t|
    t.string   "category"
    t.string   "url"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "media", ["event_id"], name: "index_media_on_event_id", using: :btree

  create_table "stats", force: :cascade do |t|
    t.float    "height"
    t.float    "weight"
    t.datetime "date"
    t.integer  "baby_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "stats", ["baby_id"], name: "index_stats_on_baby_id", using: :btree

  create_table "treatments", force: :cascade do |t|
    t.datetime "date"
    t.string   "doctor"
    t.integer  "vaccination_id"
    t.integer  "baby_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "treatments", ["baby_id"], name: "index_treatments_on_baby_id", using: :btree
  add_index "treatments", ["vaccination_id"], name: "index_treatments_on_vaccination_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "vaccinations", force: :cascade do |t|
    t.string   "type"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "babies", "users"
  add_foreign_key "events", "babies"
  add_foreign_key "media", "events"
  add_foreign_key "stats", "babies"
  add_foreign_key "treatments", "vaccinations"
end
