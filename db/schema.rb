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

ActiveRecord::Schema.define(version: 20140203210502) do

  create_table "clients", force: true do |t|
    t.string   "code"
    t.string   "zone"
    t.integer  "organisation_id"
    t.text     "notes"
    t.string   "gender"
    t.boolean  "visible"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "counselling_sessions", force: true do |t|
    t.string   "client_id"
    t.string   "zone"
    t.boolean  "billed"
    t.datetime "date"
    t.float    "length"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organisations", force: true do |t|
    t.string   "name"
    t.boolean  "billable"
    t.text     "address"
    t.string   "telephone"
    t.string   "contact_name"
    t.string   "contact_email"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "supervisors", force: true do |t|
    t.string   "name"
    t.float    "cost"
    t.text     "address"
    t.string   "contact_name"
    t.string   "zone"
    t.string   "email_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "password_salt"
    t.datetime "last_login_in"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
