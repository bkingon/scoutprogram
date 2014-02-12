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

ActiveRecord::Schema.define(:version => 20131111095717) do

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

  create_table "activities", :force => true do |t|
    t.string   "name"
    t.integer  "group_max"
    t.integer  "group_min"
    t.text     "description"
    t.text     "notes"
    t.datetime "updated_at"
    t.datetime "created_at"
    t.string   "acceptance_status",  :default => "pending"
    t.string   "main_category"
    t.integer  "recommended_time_h", :default => 0
    t.integer  "recommended_time_m", :default => 0
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
  end

  create_table "activity_resources", :force => true do |t|
    t.string  "name"
    t.text    "description"
    t.integer "quantity"
    t.integer "activity_id"
  end

  add_index "activity_resources", ["activity_id"], :name => "index_activity_resources_on_activity_id"

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
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "admin_users_roles", :id => false, :force => true do |t|
    t.integer "admin_user_id"
    t.integer "role_id"
  end

  add_index "admin_users_roles", ["admin_user_id", "role_id"], :name => "index_admin_users_roles_on_admin_user_id_and_role_id"

  create_table "code_puzzles", :force => true do |t|
    t.datetime "created_at"
    t.integer  "group_max"
    t.integer  "group_min"
    t.string   "name"
    t.time     "recommended_time"
    t.datetime "updated_at"
    t.text     "description"
    t.text     "notes"
  end

  create_table "first_aids", :force => true do |t|
    t.string   "name"
    t.integer  "group_max"
    t.integer  "group_min"
    t.time     "recommended_time"
    t.datetime "updated_at"
    t.datetime "created_at"
    t.text     "description"
    t.text     "notes"
  end

  create_table "games", :force => true do |t|
    t.string   "name"
    t.integer  "group_max"
    t.integer  "group_min"
    t.time     "recommended_time"
    t.datetime "updated_at"
    t.datetime "created_at"
    t.text     "description"
    t.text     "notes"
  end

  create_table "group_admins", :force => true do |t|
    t.integer  "user_id"
    t.string   "admin_level"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "group_id"
  end

  create_table "group_users", :force => true do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.string   "group_type"
    t.string   "country"
    t.string   "province"
    t.string   "city"
    t.string   "suburb"
    t.string   "street"
    t.string   "blurb"
    t.text     "description"
    t.string   "logo_file"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "created_by_id"
  end

  create_table "pioneering_activities", :force => true do |t|
    t.string   "name"
    t.integer  "group_max"
    t.integer  "group_min"
    t.time     "recommended_time"
    t.datetime "updated_at"
    t.datetime "created_at"
    t.text     "description"
    t.text     "notes"
  end

  create_table "program_builds", :force => true do |t|
    t.integer "activity_id"
    t.integer "program_id"
  end

  add_index "program_builds", ["activity_id"], :name => "index_program_builds_on_activity_id"
  add_index "program_builds", ["program_id"], :name => "index_program_builds_on_program_id"

  create_table "program_items", :force => true do |t|
    t.integer  "activity_id"
    t.integer  "program_id"
    t.text     "theme"
    t.string   "theme_title"
    t.text     "notes"
    t.integer  "duration"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "programs", :force => true do |t|
    t.string  "name"
    t.string  "theme"
    t.text    "theme_description"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.integer "duration"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "taggings", :force => true do |t|
    t.integer "tag_id"
    t.integer "activity_id"
  end

  add_index "taggings", ["activity_id"], :name => "index_taggings_on_activity_id"
  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"

  create_table "tags", :force => true do |t|
    t.string  "name"
    t.integer "created_by_id"
    t.integer "updated_by_id"
  end

  create_table "trainings", :force => true do |t|
    t.string   "name"
    t.integer  "group_max"
    t.integer  "group_min"
    t.time     "recommended_time"
    t.datetime "updated_at"
    t.datetime "created_at"
    t.text     "description"
    t.text     "notes"
  end

  create_table "users", :force => true do |t|
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

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
