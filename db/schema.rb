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

ActiveRecord::Schema.define(version: 20190213074417) do

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                             null: false
    t.integer  "status",                           null: false
    t.integer  "shipping_method",                  null: false
    t.string   "region",                           null: false
    t.integer  "shipping_timetable",               null: false
    t.text     "description",        limit: 65535, null: false
    t.integer  "price",                            null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "seller_id",                        null: false
    t.integer  "buyer_id"
    t.integer  "shipping_burden",                  null: false
    t.string   "image",                            null: false
    t.index ["buyer_id"], name: "index_products_on_buyer_id", using: :btree
    t.index ["name"], name: "index_products_on_name", using: :btree
    t.index ["seller_id"], name: "index_products_on_seller_id", using: :btree
  end

  create_table "sns_credentials", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "nickname"
    t.string   "email"
    t.string   "password"
    t.string   "image"
    t.index ["user_id"], name: "index_sns_credentials_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "family_name",                          default: "", null: false
    t.string   "first_name",                           default: "", null: false
    t.string   "family_katakana",                      default: "", null: false
    t.string   "first_katakana",                       default: "", null: false
    t.string   "postal_code"
    t.string   "domicile_pref",                        default: "", null: false
    t.string   "domicile_city",                        default: "", null: false
    t.string   "domicile_add",                         default: "", null: false
    t.string   "building"
    t.string   "phone_number",                         default: "", null: false
    t.text     "profile",                limit: 65535
    t.string   "nickname",                                          null: false
    t.string   "email",                                default: "", null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "birthday_year"
    t.integer  "birthday_month"
    t.integer  "birthday_day"
    t.string   "image"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "products", "users", column: "buyer_id"
  add_foreign_key "products", "users", column: "seller_id"
  add_foreign_key "sns_credentials", "users"
end
