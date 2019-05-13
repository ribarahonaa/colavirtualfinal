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

ActiveRecord::Schema.define(version: 2019_05_13_023911) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "atraccions", force: :cascade do |t|
    t.string "nombre_atc"
    t.text "descripcion_atc"
    t.string "imagen_atc"
    t.integer "capacidad_atc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estados", force: :cascade do |t|
    t.string "descripcion_est"
  end

  create_table "group_memberships", force: :cascade do |t|
    t.string "member_type", null: false
    t.bigint "member_id", null: false
    t.string "group_type"
    t.bigint "group_id"
    t.string "group_name"
    t.string "membership_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_name"], name: "index_group_memberships_on_group_name"
    t.index ["group_type", "group_id"], name: "index_group_memberships_on_group_type_and_group_id"
    t.index ["member_type", "member_id"], name: "index_group_memberships_on_member_type_and_member_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "operaciones_atraccions", force: :cascade do |t|
    t.bigint "users_id"
    t.bigint "atraccions_id"
    t.bigint "tickets_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["atraccions_id"], name: "index_operaciones_atraccions_on_atraccions_id"
    t.index ["tickets_id"], name: "index_operaciones_atraccions_on_tickets_id"
    t.index ["users_id"], name: "index_operaciones_atraccions_on_users_id"
  end

  create_table "ticket_estados", force: :cascade do |t|
    t.bigint "estados_id"
    t.bigint "tickets_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estados_id"], name: "index_ticket_estados_on_estados_id"
    t.index ["tickets_id"], name: "index_ticket_estados_on_tickets_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "last_name"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "operaciones_atraccions", "atraccions", column: "atraccions_id"
  add_foreign_key "operaciones_atraccions", "tickets", column: "tickets_id"
  add_foreign_key "operaciones_atraccions", "users", column: "users_id"
  add_foreign_key "ticket_estados", "estados", column: "estados_id"
  add_foreign_key "ticket_estados", "tickets", column: "tickets_id"
end
