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

ActiveRecord::Schema.define(version: 2020_02_17_105338) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accessory_items", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.integer "price_cents", null: false
    t.integer "stock", default: 0, null: false
    t.bigint "item_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_category_id"], name: "index_accessory_items_on_item_category_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "items_count", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "item_categories", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.integer "items_count", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_item_categories_on_name", unique: true
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.text "address", null: false
    t.integer "status", default: 0, null: false
    t.integer "items_count", default: 0, null: false
    t.integer "total_cents", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "selected_items", force: :cascade do |t|
    t.bigint "accessory_item_id", null: false
    t.bigint "cart_id"
    t.bigint "order_id"
    t.integer "price_cents", null: false
    t.integer "quantity", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["accessory_item_id"], name: "index_selected_items_on_accessory_item_id"
    t.index ["cart_id"], name: "index_selected_items_on_cart_id"
    t.index ["order_id"], name: "index_selected_items_on_order_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "accessory_items", "item_categories"
  add_foreign_key "carts", "users"
  add_foreign_key "orders", "users"
  add_foreign_key "selected_items", "accessory_items"
  add_foreign_key "selected_items", "carts"
  add_foreign_key "selected_items", "orders"
end
