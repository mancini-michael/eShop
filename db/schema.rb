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

ActiveRecord::Schema[7.0].define(version: 2022_07_26_130722) do
  create_table "carts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "insertion_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["insertion_id"], name: "index_carts_on_insertion_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "insertions", force: :cascade do |t|
    t.integer "seller_id", null: false
    t.string "title", default: "", null: false
    t.string "description", default: "", null: false
    t.decimal "price", default: "0.0", null: false
    t.integer "categories", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seller_id"], name: "index_insertions_on_seller_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "seller_id", null: false
    t.integer "insertion_id", null: false
    t.string "question", default: ""
    t.string "reply", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["insertion_id"], name: "index_questions_on_insertion_id"
    t.index ["seller_id"], name: "index_questions_on_seller_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "seller_id", null: false
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seller_id"], name: "index_reviews_on_seller_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "sellers", force: :cascade do |t|
    t.integer "user_id", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sellers_on_user_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "city", default: "", null: false
    t.string "zip_code", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "avatar", default: "", null: false
    t.string "uid", default: "", null: false
    t.string "provider", default: "local", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wishlists", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "insertion_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["insertion_id"], name: "index_wishlists_on_insertion_id"
    t.index ["user_id"], name: "index_wishlists_on_user_id"
  end

  add_foreign_key "carts", "insertions"
  add_foreign_key "carts", "users"
  add_foreign_key "insertions", "sellers"
  add_foreign_key "questions", "insertions"
  add_foreign_key "questions", "sellers"
  add_foreign_key "reviews", "sellers"
  add_foreign_key "reviews", "users"
  add_foreign_key "sellers", "users"
  add_foreign_key "wishlists", "insertions"
  add_foreign_key "wishlists", "users"
end
