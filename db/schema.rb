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

ActiveRecord::Schema.define(version: 20161005082827) do

  create_table "events", force: :cascade do |t|
    t.string   "name",            limit: 255, default: "N/A", null: false
    t.integer  "attending_count", limit: 4,   default: 0
    t.datetime "end_time"
    t.string   "place",           limit: 45,  default: "N/A"
  end

  create_table "subscriptions", id: false, force: :cascade do |t|
    t.integer  "id",         limit: 4,                null: false
    t.integer  "event_id",   limit: 8,                null: false
    t.integer  "user_id",    limit: 4,                null: false
    t.boolean  "status",               default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "event_id", limit: 8
    t.string  "link",     limit: 255,             null: false
    t.integer "sent",     limit: 4,   default: 0, null: false
  end

  create_table "users", id: false, force: :cascade do |t|
    t.integer  "id",         limit: 4,                   null: false
    t.string   "name",       limit: 255, default: "N/A"
    t.string   "email",      limit: 255,                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
