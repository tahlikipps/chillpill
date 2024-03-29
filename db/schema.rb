# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_15_094159) do
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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "chats", force: :cascade do |t|
    t.bigint "pet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "owner_id", null: false
    t.bigint "vet_id", null: false
    t.index ["owner_id"], name: "index_chats_on_owner_id"
    t.index ["pet_id"], name: "index_chats_on_pet_id"
    t.index ["vet_id"], name: "index_chats_on_vet_id"
  end

  create_table "medication_administrations", force: :cascade do |t|
    t.datetime "date", precision: nil
    t.boolean "is_given"
    t.bigint "medication_id", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medication_id"], name: "index_medication_administrations_on_medication_id"
    t.index ["user_id"], name: "index_medication_administrations_on_user_id"
  end

  create_table "medications", force: :cascade do |t|
    t.string "name"
    t.string "medication_type"
    t.string "dosage"
    t.integer "frequency"
    t.string "time_period"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "pet_id"
    t.string "status", default: "active", null: false
    t.index ["pet_id"], name: "index_medications_on_pet_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "chat_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "pet_carers", force: :cascade do |t|
    t.integer "status"
    t.bigint "pet_id", null: false
    t.bigint "user_id", null: false
    t.boolean "is_owner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_pet_carers_on_pet_id"
    t.index ["user_id"], name: "index_pet_carers_on_user_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "address"
    t.string "name"
    t.date "birth_date"
    t.string "species"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "phone_number"
    t.boolean "is_vet", default: false
    t.string "address"
    t.boolean "admin"
    t.float "latitude"
    t.float "longitude"
    t.text "bio"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "chats", "pets"
  add_foreign_key "chats", "users", column: "owner_id"
  add_foreign_key "chats", "users", column: "vet_id"
  add_foreign_key "medication_administrations", "medications"
  add_foreign_key "medication_administrations", "users"
  add_foreign_key "medications", "pets"
  add_foreign_key "messages", "chats"
  add_foreign_key "messages", "users"
  add_foreign_key "pet_carers", "pets"
  add_foreign_key "pet_carers", "users"
end
