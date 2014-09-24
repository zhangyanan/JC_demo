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

ActiveRecord::Schema.define(:version => 20140923075038) do

  create_table "card_records", :id => false, :force => true do |t|
    t.integer "id",                         :null => false
    t.integer "card_id"
    t.integer "terminal_id"
    t.string  "created_at",  :limit => nil
  end

  create_table "cards", :id => false, :force => true do |t|
    t.integer "id",                         :null => false
    t.integer "employee_id"
    t.string  "created_at",  :limit => nil
    t.string  "update_at",   :limit => nil
    t.string  "lost_at",     :limit => nil
  end

  create_table "menus", :force => true do |t|
    t.string   "name"
    t.integer  "parent_menu_id"
    t.string   "url"
    t.integer  "right_id"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "creator"
    t.integer  "state"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "tasks_count", :default => 0
    t.string   "project_url"
  end

  create_table "rights", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "state"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "role_rights", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "role_id"
    t.integer "right_id"
  end

  create_table "role_users", :force => true do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",       :default => "1"
  end

  create_table "tasks", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "operation"
    t.integer  "state"
    t.integer  "creator"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "project_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password"
    t.string   "state",      :default => "1"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
