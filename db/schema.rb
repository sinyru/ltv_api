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

ActiveRecord::Schema.define(version: 20180726182858) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "all_orders", force: :cascade do |t|
    t.string   "order_unique_key",                 null: false
    t.bigint   "order_id"
    t.bigint   "customer_id"
    t.datetime "created_at",                       null: false
    t.string   "variant_title"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "quantity"
    t.float    "price"
    t.string   "product_title"
    t.string   "item_type"
    t.boolean  "s_24",             default: false
    t.boolean  "s_12",             default: false
    t.boolean  "s_6",              default: false
    t.boolean  "s_sub",            default: false
    t.boolean  "prod_sub",         default: false
    t.datetime "updated_at",                       null: false
  end

  create_table "examples", force: :cascade do |t|
    t.text     "text",       null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_examples_on_user_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rdates", force: :cascade do |t|
    t.string   "start_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "token",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["token"], name: "index_users_on_token", unique: true, using: :btree
  end

  add_foreign_key "examples", "users"
end
