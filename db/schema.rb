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

ActiveRecord::Schema.define(version: 20170802004602) do

  create_table "alerts", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_alerts_on_user_id"
  end

  create_table "game_hitting_stats", force: :cascade do |t|
    t.integer "player_id"
    t.integer "game_id"
    t.integer "ab"
    t.integer "pa"
    t.integer "single"
    t.integer "double"
    t.integer "triple"
    t.integer "hr"
    t.integer "bb"
    t.integer "error"
    t.integer "fc"
    t.integer "hb"
    t.integer "wp"
    t.integer "pb"
    t.integer "sb"
    t.integer "rbi"
    t.integer "r"
    t.integer "earned_run"
    t.integer "sac"
    t.integer "k"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_hitting_stats_on_game_id"
    t.index ["player_id"], name: "index_game_hitting_stats_on_player_id"
  end

  create_table "game_pitching_stats", force: :cascade do |t|
    t.integer "player_id"
    t.integer "game_id"
    t.integer "batters_retired"
    t.integer "r"
    t.integer "er"
    t.integer "sv"
    t.integer "cg"
    t.integer "bf"
    t.integer "bb"
    t.integer "h"
    t.integer "single"
    t.integer "double"
    t.integer "triple"
    t.integer "hr"
    t.integer "k"
    t.integer "wp"
    t.integer "hb"
    t.integer "bk"
    t.integer "sb"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cs"
    t.index ["game_id"], name: "index_game_pitching_stats_on_game_id"
    t.index ["player_id"], name: "index_game_pitching_stats_on_player_id"
  end

  create_table "games", force: :cascade do |t|
    t.integer "home_id"
    t.integer "visitors_id"
    t.integer "winner_id"
    t.integer "loser_id"
    t.integer "location_id"
    t.integer "home_runs"
    t.integer "home_hits"
    t.integer "home_errors"
    t.integer "visitor_runs"
    t.integer "visitor_hits"
    t.integer "visitor_errors"
    t.date "date"
    t.time "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["home_id"], name: "index_games_on_home_id"
    t.index ["location_id"], name: "index_games_on_location_id"
    t.index ["loser_id"], name: "index_games_on_loser_id"
    t.index ["visitors_id"], name: "index_games_on_visitors_id"
    t.index ["winner_id"], name: "index_games_on_winner_id"
  end

  create_table "hitting_totals", force: :cascade do |t|
    t.integer "g"
    t.integer "pa"
    t.integer "ab"
    t.integer "h"
    t.integer "bb"
    t.integer "b1"
    t.integer "b2"
    t.integer "b3"
    t.integer "hr"
    t.integer "k"
    t.integer "sf"
    t.integer "sb"
    t.integer "err"
    t.integer "hb"
    t.integer "rbi"
    t.integer "r"
    t.integer "cs"
    t.decimal "ave"
    t.decimal "obp"
    t.decimal "slg"
    t.integer "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_hitting_totals_on_player_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_notes_on_team_id"
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "pitching_totals", force: :cascade do |t|
    t.integer "w"
    t.integer "l"
    t.integer "ip"
    t.integer "r"
    t.integer "er"
    t.integer "g"
    t.integer "gs"
    t.integer "sv"
    t.integer "cg"
    t.integer "bf"
    t.integer "bb"
    t.integer "h"
    t.integer "b1"
    t.integer "b2"
    t.integer "b3"
    t.integer "hr"
    t.integer "k"
    t.integer "wp"
    t.integer "hb"
    t.integer "bk"
    t.integer "sb"
    t.integer "cs"
    t.decimal "era"
    t.integer "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "batters_retired"
    t.index ["player_id"], name: "index_pitching_totals_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "birthdate"
    t.integer "bats"
    t.integer "throws"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "team_id"
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "players_positions", force: :cascade do |t|
    t.integer "player_id"
    t.integer "position_id"
    t.index ["player_id"], name: "index_players_positions_on_player_id"
    t.index ["position_id"], name: "index_players_positions_on_position_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rosters", force: :cascade do |t|
    t.integer "user_id"
    t.integer "team_id"
    t.boolean "manager"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_rosters_on_team_id"
    t.index ["user_id"], name: "index_rosters_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "wins"
    t.integer "losses"
    t.decimal "winning_percentage"
    t.decimal "games_back"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "cell"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
