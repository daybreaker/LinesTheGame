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

ActiveRecord::Schema.define(:version => 20120713025021) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "agents", :force => true do |t|
    t.string   "name"
    t.boolean  "clean"
    t.integer  "speed"
    t.integer  "accuracy"
    t.integer  "evasion"
    t.integer  "endurance"
    t.integer  "min_deputies"
    t.integer  "max_deputies"
    t.integer  "deputy_type"
    t.integer  "gun"
    t.integer  "deputy_gun"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "bags", :force => true do |t|
    t.string   "name"
    t.integer  "amount"
    t.integer  "price"
    t.integer  "type_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "banks", :force => true do |t|
    t.integer  "loan_amount"
    t.integer  "loan_interest"
    t.integer  "savings_account"
    t.integer  "interest"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.boolean  "clean"
    t.integer  "enemy_chance"
    t.integer  "event_chance"
    t.integer  "min_units"
    t.integer  "max_units"
    t.integer  "always_unit"
    t.boolean  "bank"
    t.boolean  "loanshark"
    t.boolean  "shop"
    t.boolean  "pub"
    t.boolean  "hospital"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "drugs", :force => true do |t|
    t.string   "name"
    t.boolean  "clean"
    t.integer  "low_price"
    t.integer  "high_price"
    t.integer  "cheap_chance"
    t.string   "cheap_str"
    t.string   "cheap_str2"
    t.integer  "cheap_divide"
    t.integer  "expensive_chance"
    t.string   "expensive_str"
    t.string   "expensive_str2"
    t.integer  "expensive_multiply"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "encounter_messages", :force => true do |t|
    t.string   "name"
    t.integer  "encounter_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "encounters", :force => true do |t|
    t.string   "name"
    t.integer  "type_id"
    t.integer  "user_id"
    t.integer  "current_endurance"
    t.integer  "cash"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "event_masters", :force => true do |t|
    t.integer  "user_id"
    t.integer  "event_chance"
    t.integer  "event_type"
    t.integer  "type_arg1"
    t.integer  "type_arg2"
    t.integer  "type_arg3"
    t.integer  "type_arg4"
    t.string   "message_str"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "events", :force => true do |t|
    t.integer  "user_id"
    t.integer  "event_type"
    t.integer  "type_arg1"
    t.integer  "type_arg2"
    t.integer  "type_arg3"
    t.integer  "type_arg4"
    t.string   "message_str"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "follower_types", :force => true do |t|
    t.string   "name"
    t.integer  "accuracy"
    t.integer  "endurance"
    t.integer  "evasion"
    t.integer  "speed"
    t.integer  "spaces"
    t.boolean  "hirable"
    t.integer  "min_price"
    t.integer  "max_price"
    t.boolean  "clean"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "followers", :force => true do |t|
    t.string   "name"
    t.integer  "current_endurance"
    t.integer  "type_id"
    t.integer  "user_id"
    t.integer  "encounter_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "gun_instances", :force => true do |t|
    t.string   "name"
    t.integer  "type_id"
    t.integer  "user_id"
    t.integer  "encounter_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "guns", :force => true do |t|
    t.string   "name"
    t.boolean  "clean"
    t.integer  "price"
    t.integer  "space"
    t.integer  "damage"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "high_scores", :force => true do |t|
    t.string   "name"
    t.integer  "score"
    t.boolean  "alive"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "messages", :force => true do |t|
    t.string   "name"
    t.string   "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "shops", :force => true do |t|
    t.string   "name"
    t.integer  "price"
    t.integer  "type_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "salt"
    t.integer  "wallet"
    t.integer  "days_remaining"
    t.boolean  "end_of_turn"
    t.boolean  "free"
    t.integer  "speed"
    t.integer  "accuracy"
    t.integer  "evasion"
    t.integer  "endurance"
    t.integer  "current_endurance"
    t.integer  "action"
    t.integer  "nextaction"
    t.integer  "spaces"
    t.integer  "city_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

end
