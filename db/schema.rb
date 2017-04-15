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

ActiveRecord::Schema.define(version: 20170415141911) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.string   "title",        null: false
    t.text     "body"
    t.datetime "when"
    t.datetime "deleted_at"
    t.integer  "lock_version"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "attendants", force: :cascade do |t|
    t.integer  "appointment_id"
    t.integer  "person_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["appointment_id", "person_id"], name: "index_attendants_on_appointment_id_and_person_id", unique: true, using: :btree
    t.index ["appointment_id"], name: "index_attendants_on_appointment_id", using: :btree
    t.index ["person_id"], name: "index_attendants_on_person_id", using: :btree
  end

  create_table "notes", force: :cascade do |t|
    t.string   "notable_type"
    t.integer  "notable_id"
    t.integer  "author_id"
    t.string   "title",        null: false
    t.text     "body"
    t.integer  "lock_version"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["author_id"], name: "index_notes_on_author_id", using: :btree
    t.index ["notable_type", "notable_id"], name: "index_notes_on_notable_type_and_notable_id", using: :btree
  end

  create_table "people", force: :cascade do |t|
    t.string   "name",         null: false
    t.string   "email",        null: false
    t.text     "body"
    t.integer  "lock_version"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["email"], name: "index_people_on_email", using: :btree
  end

  create_table "people_roles", id: false, force: :cascade do |t|
    t.integer "person_id", null: false
    t.integer "role_id",   null: false
    t.index ["person_id", "role_id"], name: "index_people_roles_on_person_id_and_role_id", unique: true, using: :btree
    t.index ["person_id"], name: "index_people_roles_on_person_id", using: :btree
    t.index ["role_id"], name: "index_people_roles_on_role_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "title",      null: false
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stars", force: :cascade do |t|
    t.string   "starable_type"
    t.integer  "starable_id"
    t.integer  "person_id"
    t.datetime "deleted_at"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["person_id"], name: "index_stars_on_person_id", using: :btree
    t.index ["starable_type", "starable_id"], name: "index_stars_on_starable_type_and_starable_id", using: :btree
  end

end
