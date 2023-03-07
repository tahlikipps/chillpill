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

ActiveRecord::Schema[7.0].define(version: 2023_03_07_110139) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chats", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "pet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_chats_on_pet_id"
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "medication_administrations", force: :cascade do |t|
    t.date "date"
    t.boolean "is_given"
    t.bigint "medication_id", null: false
    t.bigint "user_id", null: false
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
    t.boolean "as_owner"
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
    t.bigint "medication_id", null: false
    t.index ["medication_id"], name: "index_pets_on_medication_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "chats", "pets"
  add_foreign_key "chats", "users"
  add_foreign_key "medication_administrations", "medications"
  add_foreign_key "medication_administrations", "users"
  add_foreign_key "messages", "chats"
  add_foreign_key "messages", "users"
  add_foreign_key "pet_carers", "pets"
  add_foreign_key "pet_carers", "users"
  add_foreign_key "pets", "medications"
end
