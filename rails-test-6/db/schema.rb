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

ActiveRecord::Schema.define(version: 20160114164014) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "people", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "name"
    t.date   "dob"
    t.string "gender"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "person_id"
    t.integer "member_id"
    t.string  "type"
  end

  add_index "relationships", ["member_id"], name: "index_relationships_on_member_id", using: :btree
  add_index "relationships", ["person_id"], name: "index_relationships_on_person_id", using: :btree

end
