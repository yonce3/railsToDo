# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_10_132026) do

  create_table "authors", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.date "birth"
    t.text "address"
    t.string "ctype"
    t.binary "photo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_authors_on_user_id"
  end

  create_table "authors_books", id: false, force: :cascade do |t|
    t.integer "author_id", null: false
    t.integer "book_id", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "isbn"
    t.string "title"
    t.integer "price"
    t.string "publish"
    t.date "published"
    t.boolean "dl"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fan_comments", force: :cascade do |t|
    t.integer "author_no"
    t.string "name"
    t.text "body"
    t.boolean "deleted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "memos", force: :cascade do |t|
    t.string "memoable_type", null: false
    t.integer "memoable_id", null: false
    t.string "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["memoable_type", "memoable_id"], name: "index_memos_on_memoable_type_and_memoable_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "user_id", null: false
    t.integer "status"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_reviews_on_book_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.boolean "dm"
    t.string "roles"
    t.integer "reviews_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "authors", "users"
  add_foreign_key "reviews", "books"
  add_foreign_key "reviews", "users"
end
