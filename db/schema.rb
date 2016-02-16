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

ActiveRecord::Schema.define(version: 20160216031203) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "title"
    t.time     "start_time"
    t.float    "duration"
    t.text     "description"
    t.boolean  "proposed"
    t.boolean  "confirmed"
    t.boolean  "requires_payment"
    t.float    "cost"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "activity_type_id"
    t.integer  "user_id"
    t.integer  "venue_id"
    t.integer  "max_size"
  end

  add_index "activities", ["activity_type_id"], name: "index_activities_on_activity_type_id", using: :btree
  add_index "activities", ["user_id"], name: "index_activities_on_user_id", using: :btree
  add_index "activities", ["venue_id"], name: "index_activities_on_venue_id", using: :btree

  create_table "activity_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.integer  "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "contacts", ["user_id"], name: "index_contacts_on_user_id", using: :btree

  create_table "group_entries", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "group_id"
    t.integer  "user_id"
  end

  add_index "group_entries", ["group_id"], name: "index_group_entries_on_group_id", using: :btree
  add_index "group_entries", ["user_id"], name: "index_group_entries_on_user_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "groups", ["user_id"], name: "index_groups_on_user_id", using: :btree

  create_table "participants", force: :cascade do |t|
    t.boolean  "confirmed"
    t.boolean  "paid"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "activity_id"
  end

  add_index "participants", ["activity_id"], name: "index_participants_on_activity_id", using: :btree
  add_index "participants", ["user_id"], name: "index_participants_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "instructor"
    t.boolean  "student"
    t.string   "photo_url"
    t.string   "local_timezone"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "bio"
  end

  create_table "venues", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.text     "description"
    t.float    "geo_lat"
    t.float    "geo_lng"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "activities", "activity_types"
  add_foreign_key "activities", "users"
  add_foreign_key "activities", "venues"
  add_foreign_key "contacts", "users"
  add_foreign_key "group_entries", "groups"
  add_foreign_key "group_entries", "users"
  add_foreign_key "groups", "users"
  add_foreign_key "participants", "activities"
  add_foreign_key "participants", "users"
end
