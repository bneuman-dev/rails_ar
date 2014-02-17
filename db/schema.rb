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

ActiveRecord::Schema.define(version: 20140216212103) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "list_permissions", force: true do |t|
    t.integer  "list_user_id"
    t.integer  "list_id"
    t.integer  "permission_level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "list_permissions", ["list_id"], name: "index_list_permissions_on_list_id", using: :btree
  add_index "list_permissions", ["list_user_id"], name: "index_list_permissions_on_list_user_id", using: :btree

  create_table "list_users", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "list_users", ["creator_id"], name: "index_list_users_on_creator_id", using: :btree

  create_table "lists", force: true do |t|
    t.string   "name"
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lists", ["creator_id"], name: "index_lists_on_creator_id", using: :btree

  create_table "priorities", force: true do |t|
    t.string   "priority"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "task_lists", force: true do |t|
    t.integer  "list_id"
    t.integer  "task_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "task_lists", ["list_id"], name: "index_task_lists_on_list_id", using: :btree
  add_index "task_lists", ["task_id"], name: "index_task_lists_on_task_id", using: :btree

  create_table "tasks", force: true do |t|
    t.text     "description"
    t.boolean  "completed"
    t.datetime "deadline"
    t.integer  "priority_id"
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["creator_id"], name: "index_tasks_on_creator_id", using: :btree
  add_index "tasks", ["priority_id"], name: "index_tasks_on_priority_id", using: :btree

  create_table "user_groups", force: true do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.integer  "access_level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_groups", ["group_id"], name: "index_user_groups_on_group_id", using: :btree
  add_index "user_groups", ["user_id"], name: "index_user_groups_on_user_id", using: :btree

end
