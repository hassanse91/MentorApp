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

ActiveRecord::Schema.define(version: 20160817013148) do

  create_table "matieres", force: :cascade do |t|
    t.string   "Name"
    t.text     "Presentation"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "mentor_id"
  end

  add_index "matieres", ["mentor_id"], name: "index_matieres_on_mentor_id"

  create_table "mentors", force: :cascade do |t|
    t.string   "FirstName"
    t.string   "LastName"
    t.text     "Presentation"
    t.date     "Birthday"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
  end

  add_index "mentors", ["user_id"], name: "index_mentors_on_user_id"

  create_table "reservations", force: :cascade do |t|
    t.integer  "matiere_id"
    t.integer  "mentor_id"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "student_id"
    t.time     "time"
  end

  add_index "reservations", ["matiere_id"], name: "index_reservations_on_matiere_id"
  add_index "reservations", ["mentor_id"], name: "index_reservations_on_mentor_id"
  add_index "reservations", ["student_id"], name: "index_reservations_on_student_id"

  create_table "students", force: :cascade do |t|
    t.string   "FirstName"
    t.string   "LastName"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "students", ["user_id"], name: "index_students_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
