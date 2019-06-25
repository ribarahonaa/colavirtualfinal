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

ActiveRecord::Schema.define(version: 2019_06_25_033445) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "atraccions", force: :cascade do |t|
    t.string "nombre_atc"
    t.text "descripcion_atc"
    t.string "imagen_atc"
    t.integer "capacidad_atc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "latitude"
    t.decimal "longitude"
    t.boolean "pause"
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

  create_table "stats", force: :cascade do |t|
    t.integer "user_id"
    t.integer "atraccion_id"
    t.integer "ticket_id"
    t.datetime "created_at"
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
    t.integer "atraccion"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "operaciones_atraccions", "atraccions", column: "atraccions_id"
  add_foreign_key "operaciones_atraccions", "tickets", column: "tickets_id"
  add_foreign_key "operaciones_atraccions", "users", column: "users_id"
  add_foreign_key "ticket_estados", "estados", column: "estados_id"
  add_foreign_key "ticket_estados", "tickets", column: "tickets_id"
  create_trigger("operaciones_atraccions_after_insert_row_tr", :generated => true, :compatibility => 1).
      on("operaciones_atraccions").
      after(:insert) do
    "INSERT INTO STATS(user_id, atraccion_id, ticket_id, created_at) VALUES(NEW.users_id, NEW.atraccions_id, NEW.tickets_id, NEW.created_at);"
  end

end
