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

ActiveRecord::Schema.define(version: 2023_08_27_043009) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dislikes", force: :cascade do |t|
    t.integer "disliking_user_id"
    t.integer "disliked_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["disliked_user_id"], name: "index_dislikes_on_disliked_user_id"
    t.index ["disliking_user_id"], name: "index_dislikes_on_disliking_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "liking_user_id"
    t.integer "liked_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["liked_user_id"], name: "index_likes_on_liked_user_id"
    t.index ["liking_user_id"], name: "index_likes_on_liking_user_id"
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "liking_user_id"
    t.bigint "liked_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["liked_user_id"], name: "index_matches_on_liked_user_id"
    t.index ["liking_user_id"], name: "index_matches_on_liking_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "mobile_number"
    t.string "email"
    t.date "birthdate"
    t.string "gender"
    t.string "country"
    t.string "state_region"
    t.string "city"
    t.string "school"
    t.text "bio"
    t.integer "admin"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "sexual_orientation"
    t.index ["gender"], name: "index_users_on_gender"
  end

  add_foreign_key "matches", "users", column: "liked_user_id"
  add_foreign_key "matches", "users", column: "liking_user_id"
end
