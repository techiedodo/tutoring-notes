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

ActiveRecord::Schema.define(version: 20161029192018) do

  create_table "notes", force: :cascade do |t|
    t.text     "summary"
    t.text     "achievement"
    t.text     "next_sess"
    t.text     "recommendation"
    t.integer  "trip_dist"
    t.integer  "rate"
    t.string   "add_rate"
    t.time     "t_start"
    t.time     "t_finish"
    t.date     "sess_date"
    t.integer  "tut_session_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["tut_session_id"], name: "index_notes_on_tut_session_id"
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.text     "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "tutor_id"
    t.index ["tutor_id"], name: "index_students_on_tutor_id"
  end

  create_table "tut_sessions", force: :cascade do |t|
    t.text     "session_name"
    t.integer  "student_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["student_id"], name: "index_tut_sessions_on_student_id"
  end

  create_table "tutors", force: :cascade do |t|
    t.string   "name"
    t.text     "subjects"
    t.string   "email",                  default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "role",                   default: "tutor"
    t.index ["email"], name: "index_tutors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_tutors_on_reset_password_token", unique: true
  end

end
