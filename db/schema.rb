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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120423020550) do

  create_table "categories", :force => true do |t|
    t.string   "categorytype"
    t.decimal  "expense"
    t.date     "date_spent"
    t.integer  "week_id"
    t.integer  "month_id"
    t.string   "month_name"
    t.integer  "year"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "username"
    t.string   "email"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "remember_token"
    t.string   "salt"
    t.string   "encrypted_password"
    t.string   "encrypted_password_confirmation"
  end

  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
