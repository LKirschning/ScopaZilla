# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_04_08_073955) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_players", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_game_players_on_game_id"
  end

  create_table "games", force: :cascade do |t|
    t.integer "winning_points"
    t.integer "time_played"
    t.string "winner"
    t.integer "rounds_played"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "player_amount"
  end

  create_table "players", force: :cascade do |t|
    t.bigint "game_players_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_players_id"], name: "index_players_on_game_players_id"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "round_statistics", force: :cascade do |t|
    t.bigint "round_id", null: false
    t.integer "oro"
    t.integer "sette_bello"
    t.integer "primera"
    t.integer "cards"
    t.integer "scopa_winner"
    t.integer "scopa_loser"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["round_id"], name: "index_round_statistics_on_round_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.integer "winner_points"
    t.integer "loser_points"
    t.string "winner"
    t.string "loser"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_rounds_on_game_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "game_players", "games"
  add_foreign_key "players", "game_players", column: "game_players_id"
  add_foreign_key "players", "users"
  add_foreign_key "round_statistics", "rounds"
  add_foreign_key "rounds", "games"
end
