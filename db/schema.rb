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

ActiveRecord::Schema.define(version: 20160430020123) do

  create_table "hitting_totals", force: :cascade do |t|
    t.integer  "g"
    t.integer  "pa"
    t.integer  "ab"
    t.integer  "h"
    t.integer  "bb"
    t.integer  "b1"
    t.integer  "b2"
    t.integer  "b3"
    t.integer  "hr"
    t.integer  "k"
    t.integer  "sf"
    t.integer  "sb"
    t.integer  "err"
    t.integer  "hb"
    t.integer  "rbi"
    t.integer  "r"
    t.integer  "cs"
    t.decimal  "ave"
    t.decimal  "obp"
    t.decimal  "slg"
    t.integer  "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "hitting_totals", ["player_id"], name: "index_hitting_totals_on_player_id"

  create_table "notes", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "notes", ["team_id"], name: "index_notes_on_team_id"
  add_index "notes", ["user_id"], name: "index_notes_on_user_id"

  create_table "pitching_totals", force: :cascade do |t|
    t.integer  "w"
    t.integer  "l"
    t.integer  "ip"
    t.integer  "r"
    t.integer  "er"
    t.integer  "g"
    t.integer  "gs"
    t.integer  "sv"
    t.integer  "cg"
    t.integer  "bf"
    t.integer  "bb"
    t.integer  "h"
    t.integer  "b1"
    t.integer  "b2"
    t.integer  "b3"
    t.integer  "hr"
    t.integer  "k"
    t.integer  "wp"
    t.integer  "hb"
    t.integer  "bk"
    t.integer  "sb"
    t.integer  "cs"
    t.decimal  "era"
    t.integer  "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pitching_totals", ["player_id"], name: "index_pitching_totals_on_player_id"

  create_table "players", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthdate"
    t.integer  "bats"
    t.integer  "throws"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "positions"
  end

  create_table "rosters", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.boolean  "manager"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "rosters", ["team_id"], name: "index_rosters_on_team_id"
  add_index "rosters", ["user_id"], name: "index_rosters_on_user_id"

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "wins"
    t.integer  "losses"
    t.decimal  "winning_percentage"
    t.decimal  "games_back"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "cell"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.string   "password_digest"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

end
