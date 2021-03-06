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

ActiveRecord::Schema.define(version: 20150824122536) do

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
    t.integer  "parent_id"
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

  create_table "ads", force: :cascade do |t|
    t.string   "page"
    t.string   "img"
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "applications", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "resume_id"
    t.integer  "job_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "status",     default: "not_read"
  end

  create_table "case_companies", force: :cascade do |t|
    t.string   "name"
    t.string   "img"
    t.string   "requirement"
    t.string   "usage"
    t.string   "effect"
    t.string   "lang"
    t.boolean  "active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "case_users", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.string   "company"
    t.string   "img"
    t.text     "content"
    t.string   "lang"
    t.boolean  "active"
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

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "favorite_jobs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_cities", force: :cascade do |t|
    t.integer "job_id"
    t.integer "city_id"
  end

  create_table "job_industries", force: :cascade do |t|
    t.integer "job_id"
    t.integer "industry_id"
  end

  create_table "jobposters", force: :cascade do |t|
    t.string   "email",                  default: "",         null: false
    t.string   "encrypted_password",     default: "",         null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,          null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "roles",                  default: "--- []\n"
    t.boolean  "active",                 default: true
  end

  add_index "jobposters", ["email"], name: "index_jobposters_on_email", unique: true, using: :btree
  add_index "jobposters", ["reset_password_token"], name: "index_jobposters_on_reset_password_token", unique: true, using: :btree

  create_table "jobs", force: :cascade do |t|
    t.string   "title"
    t.string   "salary"
    t.text     "description"
    t.text     "requirement"
    t.text     "comment"
    t.date     "end_date"
    t.integer  "admin_setting_city_id"
    t.integer  "company_id"
    t.integer  "jobposter_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.boolean  "active",                default: true
    t.boolean  "adjob",                 default: false
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

  create_table "resumes", force: :cascade do |t|
    t.string   "path"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "name"
    t.boolean  "default",    default: false
    t.boolean  "active",     default: true
  end

  create_table "rusumes", force: :cascade do |t|
    t.string   "path"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                       default: "",   null: false
    t.string   "encrypted_password",          default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",               default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "tel"
    t.string   "name"
    t.string   "job"
    t.string   "country"
    t.integer  "admin_setting_education_id"
    t.integer  "admin_setting_experience_id"
    t.integer  "admin_setting_industry_id"
    t.text     "summmary"
    t.string   "resume_id"
    t.boolean  "active",                      default: true
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "companies", "jobposters"
  add_foreign_key "jobs", "admin_setting_cities"
  add_foreign_key "jobs", "companies"
  add_foreign_key "jobs", "jobposters"
end
