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

ActiveRecord::Schema[7.0].define(version: 2022_10_19_200437) do
  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.string "birth_place"
    t.integer "show_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["show_id"], name: "index_characters_on_show_id"
  end

  create_table "episodes", force: :cascade do |t|
    t.string "name"
    t.date "air_date"
    t.string "episode_number"
    t.integer "show_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["show_id"], name: "index_episodes_on_show_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "dimension"
    t.integer "show_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["show_id"], name: "index_locations_on_show_id"
  end

  create_table "shows", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.integer "character_id", null: false
    t.integer "location_id", null: false
    t.integer "episode_id", null: false
    t.integer "show_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_users_on_character_id"
    t.index ["episode_id"], name: "index_users_on_episode_id"
    t.index ["location_id"], name: "index_users_on_location_id"
    t.index ["show_id"], name: "index_users_on_show_id"
  end

  add_foreign_key "characters", "shows"
  add_foreign_key "episodes", "shows"
  add_foreign_key "locations", "shows"
  add_foreign_key "users", "characters"
  add_foreign_key "users", "episodes"
  add_foreign_key "users", "locations"
  add_foreign_key "users", "shows"
end
