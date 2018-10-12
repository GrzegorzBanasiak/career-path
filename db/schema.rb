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

ActiveRecord::Schema.define(version: 2018_10_12_183928) do

  create_table "answer_questions", force: :cascade do |t|
    t.integer "answer_id"
    t.integer "question_option_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "question_id"
    t.index ["answer_id"], name: "index_answer_questions_on_answer_id"
    t.index ["question_id"], name: "index_answer_questions_on_question_id"
    t.index ["question_option_id"], name: "index_answer_questions_on_question_option_id"
  end

  create_table "answers", force: :cascade do |t|
    t.string "firstname", null: false
    t.string "secondname", null: false
    t.string "email", null: false
    t.string "phonenumber", null: false
    t.string "city", null: false
    t.boolean "is_readed", default: false, null: false
    t.boolean "is_consant", null: false
    t.integer "form_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_answers_on_form_id"
  end

  create_table "forms", force: :cascade do |t|
    t.string "position"
    t.string "description"
    t.string "location"
    t.string "company"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "consent", default: "Wyrażam zgodę na przetwarzanie moich danych osobowych w procesie rekrutacji na w.w. stanowisko i prowadzonego przez firmę „Przykładowa Firma” sp. z o.o. Jednocześnie oświadczam, że zostałam/em poinformowana o przysługującym mi prawie dostępu do treści moich danych oraz ich poprawiania, wycofania zgody na ich przetwarzanie w każdym czasie, jak również, że podanie tych danych było dobrowolne.", null: false
    t.index ["user_id"], name: "index_forms_on_user_id"
  end

  create_table "question_options", force: :cascade do |t|
    t.string "content", null: false
    t.integer "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_question_options_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "content", null: false
    t.boolean "is_closed", default: false, null: false
    t.integer "form_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "necessary", default: false, null: false
    t.index ["form_id"], name: "index_questions_on_form_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
