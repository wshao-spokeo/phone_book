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

ActiveRecord::Schema.define(version: 20160810021112) do

  create_table "contacts", force: :cascade do |t|
    t.string   "first_name", limit: 255, null: false
    t.string   "last_name",  limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "email_addresses", force: :cascade do |t|
    t.integer  "contact_id", limit: 4,   default: 0, null: false
    t.string   "content",    limit: 255,             null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "priority",   limit: 4,               null: false
  end

  add_index "email_addresses", ["contact_id"], name: "fk_rails_4d0f0f2e58", using: :btree

  create_table "phone_number_kinds", force: :cascade do |t|
    t.string   "kind",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "phone_numbers", force: :cascade do |t|
    t.integer  "contact_id", limit: 4,   default: 0, null: false
    t.string   "content",    limit: 255,             null: false
    t.integer  "kind_id",    limit: 4,               null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "priority",   limit: 4,               null: false
  end

  add_index "phone_numbers", ["contact_id"], name: "fk_rails_a91cb86194", using: :btree

  create_table "street_addresses", force: :cascade do |t|
    t.integer  "contact_id", limit: 4,   default: 0, null: false
    t.string   "content",    limit: 255,             null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "priority",   limit: 4,               null: false
  end

  add_index "street_addresses", ["contact_id"], name: "fk_rails_ecd2d6633c", using: :btree

  add_foreign_key "email_addresses", "contacts"
  add_foreign_key "phone_numbers", "contacts"
  add_foreign_key "street_addresses", "contacts"
end
