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

ActiveRecord::Schema.define(version: 20150627152648) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_setting_cities", force: :cascade do |t|
    t.string   "name"
    t.string   "en"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "admin_setting_province_id"
  end

  create_table "admin_setting_educations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en"
  end

  create_table "admin_setting_experiences", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en"
  end

  create_table "admin_setting_industries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en"
  end

  create_table "admin_setting_job_titles", force: :cascade do |t|
    t.string   "name"
    t.integer  "admin_setting_industry_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "admin_setting_provinces", force: :cascade do |t|
    t.string   "name"
    t.string   "en"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "jobposter_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "companies", ["jobposter_id"], name: "index_companies_on_jobposter_id", using: :btree

  create_table "jobposters", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "jobposters", ["email"], name: "index_jobposters_on_email", unique: true, using: :btree
  add_index "jobposters", ["reset_password_token"], name: "index_jobposters_on_reset_password_token", unique: true, using: :btree

  create_table "jobs", force: :cascade do |t|
    t.string   "title"
    t.string   "salary"
    t.text     "description"
    t.text     "requirement"
    t.text     "comment"
    t.date     "endDate"
    t.integer  "admin_setting_city_id"
    t.integer  "company_id"
    t.integer  "jobposter_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "jobs", ["admin_setting_city_id"], name: "index_jobs_on_admin_setting_city_id", using: :btree
  add_index "jobs", ["company_id"], name: "index_jobs_on_company_id", using: :btree
  add_index "jobs", ["jobposter_id"], name: "index_jobs_on_jobposter_id", using: :btree

  create_table "jobseekers", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "jobseekers", ["email"], name: "index_jobseekers_on_email", unique: true, using: :btree
  add_index "jobseekers", ["reset_password_token"], name: "index_jobseekers_on_reset_password_token", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                       default: "", null: false
    t.string   "encrypted_password",          default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",               default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "tel"
    t.string   "name"
    t.string   "job"
    t.string   "country"
    t.integer  "admin_setting_education_id"
    t.integer  "admin_setting_experience_id"
    t.integer  "admin_setting_industry_id"
    t.text     "summmary"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "companies", "jobposters"
  add_foreign_key "jobs", "admin_setting_cities"
  add_foreign_key "jobs", "companies"
  add_foreign_key "jobs", "jobposters"
end
