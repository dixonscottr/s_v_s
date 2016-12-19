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

ActiveRecord::Schema.define(version: 20161219222528) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "matches", force: :cascade do |t|
    t.integer  "shiba_one_id",                 null: false
    t.integer  "shiba_two_id",                 null: false
    t.integer  "creator_id",                   null: false
    t.integer  "winner_id"
    t.integer  "loser_id"
    t.boolean  "video",        default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["creator_id"], name: "index_matches_on_creator_id", using: :btree
    t.index ["loser_id"], name: "index_matches_on_loser_id", using: :btree
    t.index ["shiba_one_id"], name: "index_matches_on_shiba_one_id", using: :btree
    t.index ["shiba_two_id"], name: "index_matches_on_shiba_two_id", using: :btree
    t.index ["winner_id"], name: "index_matches_on_winner_id", using: :btree
  end

  create_table "shibas", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",                        null: false
    t.string   "email",                           null: false
    t.string   "password_digest"
    t.boolean  "admin",           default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "token"
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "voter_id",   null: false
    t.integer  "shiba_id",   null: false
    t.integer  "match_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_votes_on_match_id", using: :btree
    t.index ["shiba_id"], name: "index_votes_on_shiba_id", using: :btree
    t.index ["voter_id"], name: "index_votes_on_voter_id", using: :btree
  end

end
