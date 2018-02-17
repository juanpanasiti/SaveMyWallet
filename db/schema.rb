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

ActiveRecord::Schema.define(version: 20180213181317) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "credit_cards", force: :cascade do |t|
    t.bigint "user_id"
    t.string "issuer"
    t.string "kind"
    t.date "expiration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_credit_cards_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "purchase_id"
    t.integer "fee"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["purchase_id"], name: "index_payments_on_purchase_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.string "item_name"
    t.bigint "user_id"
    t.bigint "credit_card_id"
    t.decimal "amount"
    t.integer "fees"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "first_payment"
    t.index ["credit_card_id"], name: "index_purchases_on_credit_card_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "credit_cards", "users"
  add_foreign_key "payments", "purchases"
  add_foreign_key "purchases", "credit_cards"
  add_foreign_key "purchases", "users"
end
