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

ActiveRecord::Schema.define(version: 20141129004858) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applieds", force: true do |t|
    t.integer  "RateeGroup_id"
    t.integer  "Developer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "applieds", ["Developer_id"], name: "index_applieds_on_Developer_id", using: :btree
  add_index "applieds", ["RateeGroup_id"], name: "index_applieds_on_RateeGroup_id", using: :btree

  create_table "companies", primary_key: "name", force: true do |t|
  end

  add_index "companies", ["name"], name: "index_companies_on_name", unique: true, using: :btree

  create_table "departments", id: false, force: true do |t|
    t.string "dname", null: false
    t.string "cname", null: false
  end

  add_index "departments", ["dname", "cname"], name: "index_departments_on_dname_and_cname", unique: true, using: :btree

  create_table "developers", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "name"
    t.string   "cname",                                  null: false
    t.string   "dname"
    t.boolean  "admin",                  default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "developers", ["cname"], name: "index_developers_on_cname", using: :btree
  add_index "developers", ["dname"], name: "index_developers_on_dname", using: :btree
  add_index "developers", ["email"], name: "index_developers_on_email", unique: true, using: :btree
  add_index "developers", ["reset_password_token"], name: "index_developers_on_reset_password_token", unique: true, using: :btree

  create_table "evaluations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mappings", id: false, force: true do |t|
    t.integer "RateeGroup_id", null: false
    t.integer "RaterGroup_id", null: false
    t.integer "Evaluation_id", null: false
  end

  add_index "mappings", ["Evaluation_id"], name: "index_mappings_on_Evaluation_id", using: :btree
  add_index "mappings", ["RateeGroup_id", "RaterGroup_id"], name: "index_mappings_on_RateeGroup_id_and_RaterGroup_id", unique: true, using: :btree
  add_index "mappings", ["RateeGroup_id"], name: "index_mappings_on_RateeGroup_id", using: :btree
  add_index "mappings", ["RaterGroup_id"], name: "index_mappings_on_RaterGroup_id", using: :btree

  create_table "materials", force: true do |t|
    t.string   "subject",      null: false
    t.text     "content",      null: false
    t.integer  "field",        null: false
    t.integer  "developer_id", null: false
    t.integer  "prate",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "materials", ["developer_id"], name: "index_materials_on_developer_id", using: :btree

  create_table "ratee_groups", force: true do |t|
  end

  create_table "rater_groups", force: true do |t|
  end

  create_table "results", force: true do |t|
    t.integer  "value",         default: 0
    t.integer  "RaterGroup_id",             null: false
    t.integer  "RateeGroup_id",             null: false
    t.integer  "Evaluation_id",             null: false
    t.integer  "Material_id",               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "results", ["Evaluation_id"], name: "index_results_on_Evaluation_id", using: :btree
  add_index "results", ["RateeGroup_id"], name: "index_results_on_RateeGroup_id", using: :btree
  add_index "results", ["RaterGroup_id"], name: "index_results_on_RaterGroup_id", using: :btree

  create_table "selecteds", force: true do |t|
    t.integer  "RaterGroup_id"
    t.integer  "Developer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "selecteds", ["Developer_id"], name: "index_selecteds_on_Developer_id", using: :btree
  add_index "selecteds", ["RaterGroup_id"], name: "index_selecteds_on_RaterGroup_id", using: :btree

end
