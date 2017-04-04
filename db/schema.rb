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

ActiveRecord::Schema.define(version: 20170401215245) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "organizations", force: :cascade do |t|
    t.integer  "creator_id"
    t.string   "name",        limit: 100, null: false
    t.text     "description",             null: false
    t.string   "era_served",              null: false
    t.string   "category",                null: false
    t.float    "avg_rating",              null: false
    t.string   "url",                     null: false
    t.string   "address1",                null: false
    t.string   "address2"
    t.string   "city",                    null: false
    t.string   "state",                   null: false
    t.integer  "zipcode",                 null: false
    t.integer  "phone"
    t.string   "email"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "rating",          null: false
    t.text     "feedback",        null: false
    t.boolean  "recommend",       null: false
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",        limit: 50
    t.string   "service_era", limit: 50
    t.string   "status"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
