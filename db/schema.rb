# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20181020015137) do

  create_table "bird_images", force: :cascade do |t|
    t.string   "image"
    t.integer  "bird_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "birds", force: :cascade do |t|
    t.string   "bird_name",  default: ""
    t.text     "bird_info"
    t.integer  "bird_price", default: 0,  null: false
    t.string   "bird_voice"
    t.integer  "species_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "comment"
    t.integer  "rating",     default: 0, null: false
    t.integer  "user_id",    default: 1, null: false
    t.integer  "bird_id",    default: 1, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "species", force: :cascade do |t|
    t.string   "species_name"
    t.text     "species_info"
    t.integer  "min_price",    default: 0
    t.integer  "max_price",    default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name",              default: "",         null: false
    t.string   "email",                  default: "",         null: false
    t.string   "encrypted_password",     default: "",         null: false
    t.integer  "user_role",              default: 0,          null: false
    t.datetime "birthdate"
    t.string   "sex"
    t.string   "phone"
    t.string   "avatar",                 default: "anon.jpg"
    t.string   "description",            default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,          null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["user_name"], name: "index_users_on_user_name", unique: true

end
