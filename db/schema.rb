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

ActiveRecord::Schema.define(version: 2018_05_04_155535) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "questionnaire_id"
    t.bigint "category_id"
    t.bigint "option_id"
    t.bigint "question_id"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_answers_on_category_id"
    t.index ["option_id"], name: "index_answers_on_option_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["questionnaire_id"], name: "index_answers_on_questionnaire_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "max_value"
    t.integer "min_value"
    t.integer "good_below"
    t.integer "average_below"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "challenges", force: :cascade do |t|
    t.string "challenge"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_challenges_on_category_id"
  end

  create_table "options", force: :cascade do |t|
    t.string "option"
    t.integer "value"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_options_on_question_id"
  end

  create_table "questionnaires", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_questionnaires_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "question"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_questions_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "slack_id"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slack_id"], name: "index_users_on_slack_id", unique: true
  end

  add_foreign_key "answers", "categories"
  add_foreign_key "answers", "options"
  add_foreign_key "answers", "questionnaires"
  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "challenges", "categories"
  add_foreign_key "options", "questions"
  add_foreign_key "questionnaires", "users"
  add_foreign_key "questions", "categories"
end
