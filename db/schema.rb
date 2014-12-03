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

ActiveRecord::Schema.define(version: 20141130080409) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applieds", force: true do |t|
    t.integer  "ratee_group_id"
    t.integer  "developer_id",   null: false
    t.integer  "evaluation_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "applieds", ["developer_id"], name: "index_applieds_on_developer_id", using: :btree
  add_index "applieds", ["evaluation_id"], name: "index_applieds_on_evaluation_id", using: :btree
  add_index "applieds", ["ratee_group_id"], name: "index_applieds_on_ratee_group_id", using: :btree

  create_table "careers", force: true do |t|
    t.integer  "developer_id"
    t.string   "prev"
    t.string   "current"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "careers", ["developer_id"], name: "index_careers_on_developer_id", using: :btree

  create_table "companies", id: false, force: true do |t|
    t.string "name", null: false
  end

  add_index "companies", ["name"], name: "index_companies_on_name", unique: true, using: :btree

  create_table "departments", id: false, force: true do |t|
    t.string "dname", null: false
    t.string "cname", null: false
  end

  add_index "departments", ["dname", "cname"], name: "index_departments_on_dname_and_cname", unique: true, using: :btree

  create_table "developers", force: true do |t|
    t.string   "email",                  default: "",           null: false
    t.string   "encrypted_password",     default: "",           null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,            null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "name"
    t.string   "cname",                  default: "freelancer", null: false
    t.string   "dname"
    t.boolean  "admin",                  default: false,        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "developers", ["cname"], name: "index_developers_on_cname", using: :btree
  add_index "developers", ["dname"], name: "index_developers_on_dname", using: :btree
  add_index "developers", ["email"], name: "index_developers_on_email", unique: true, using: :btree
  add_index "developers", ["reset_password_token"], name: "index_developers_on_reset_password_token", unique: true, using: :btree

  create_table "evaluations", force: true do |t|
    t.boolean  "appliable",  default: true
    t.boolean  "processed",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mappings", id: false, force: true do |t|
    t.integer "ratee_group_id", null: false
    t.integer "rater_group_id", null: false
    t.integer "evaluation_id",  null: false
  end

  add_index "mappings", ["evaluation_id"], name: "index_mappings_on_evaluation_id", using: :btree
  add_index "mappings", ["ratee_group_id", "rater_group_id"], name: "index_mappings_on_ratee_group_id_and_rater_group_id", unique: true, using: :btree
  add_index "mappings", ["ratee_group_id"], name: "index_mappings_on_ratee_group_id", using: :btree
  add_index "mappings", ["rater_group_id"], name: "index_mappings_on_rater_group_id", using: :btree

  create_table "materials", force: true do |t|
    t.string   "subject",      null: false
    t.text     "content",      null: false
    t.integer  "field",        null: false
    t.integer  "developer_id", null: false
    t.float    "prate",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "materials", ["developer_id"], name: "index_materials_on_developer_id", using: :btree

  create_table "ratee_groups", force: true do |t|
    t.integer "evaluation_id", null: false
  end

  add_index "ratee_groups", ["evaluation_id"], name: "index_ratee_groups_on_evaluation_id", using: :btree

  create_table "rater_groups", force: true do |t|
    t.integer "evaluation_id", null: false
  end

  add_index "rater_groups", ["evaluation_id"], name: "index_rater_groups_on_evaluation_id", using: :btree

  create_table "results", force: true do |t|
    t.float    "value",         default: 0.0
    t.integer  "ratee_id",                    null: false
    t.integer  "rater_id",                    null: false
    t.integer  "evaluation_id",               null: false
    t.integer  "material_id",                 null: false
    t.string   "ratee_cname",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "results", ["evaluation_id"], name: "index_results_on_evaluation_id", using: :btree

  create_table "selecteds", force: true do |t|
    t.integer  "rater_group_id"
    t.integer  "developer_id",   null: false
    t.integer  "evaluation_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "selecteds", ["developer_id"], name: "index_selecteds_on_developer_id", using: :btree
  add_index "selecteds", ["evaluation_id"], name: "index_selecteds_on_evaluation_id", using: :btree
  add_index "selecteds", ["rater_group_id"], name: "index_selecteds_on_rater_group_id", using: :btree

end
