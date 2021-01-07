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

ActiveRecord::Schema.define(version: 20210107055710) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cohorts", force: :cascade do |t|
    t.string   "cohort_id"
    t.string   "program"
    t.string   "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "phase_num"
    t.string   "website_link"
    t.string   "github_link"
    t.string   "blog_link"
    t.string   "video_link"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "survey_data", force: :cascade do |t|
    t.string   "design_data"
    t.string   "navigation_data"
    t.string   "content_data"
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "survey_questions", force: :cascade do |t|
    t.string   "design_question"
    t.string   "navigation_question"
    t.string   "content_question"
    t.string   "performance_question"
    t.integer  "phase_num"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "surveys", force: :cascade do |t|
    t.string   "design_question"
    t.string   "navigation_question"
    t.string   "content_question"
    t.string   "performance_question"
    t.integer  "phase_num"
    t.integer  "rating"
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "cohort_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
