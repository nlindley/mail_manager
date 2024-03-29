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

ActiveRecord::Schema.define(:version => 20120811081349) do

  create_table "aliases", :force => true do |t|
    t.integer "domain_id",                  :null => false
    t.string  "source",      :limit => 100, :null => false
    t.string  "destination", :limit => 100, :null => false
  end

  add_index "aliases", ["domain_id"], :name => "domain_id"

  create_table "domains", :force => true do |t|
    t.string "name", :limit => 50, :null => false
  end

  create_table "users", :force => true do |t|
    t.integer "domain_id",                         :null => false
    t.string  "password_encrypted", :limit => 32,  :null => false
    t.string  "username",           :limit => 100, :null => false
    t.boolean "admin"
    t.boolean "super_admin"
  end

  add_index "users", ["domain_id"], :name => "domain_id"
  add_index "users", ["username"], :name => "username"

end
