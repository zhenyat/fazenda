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

ActiveRecord::Schema[7.0].define(version: 2023_07_16_145802) do
  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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

  create_table "families", force: :cascade do |t|
    t.string "name", null: false
    t.string "title", null: false
    t.string "comment"
    t.integer "status", limit: 1, default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_families_on_name", unique: true
  end

  create_table "locations", force: :cascade do |t|
    t.integer "number", null: false
    t.string "title", null: false
    t.string "comment"
    t.integer "status", limit: 1, default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["number"], name: "index_locations_on_number", unique: true
    t.check_constraint "number > 0"
  end

  create_table "plants", force: :cascade do |t|
    t.integer "family_id", null: false
    t.string "name", null: false
    t.string "sci_name", null: false
    t.string "common_name", null: false
    t.integer "kind", limit: 1, default: 0, null: false
    t.integer "coldest", limit: 1, default: 0, null: false
    t.integer "warmest", limit: 1, default: 0, null: false
    t.float "height_min", null: false
    t.float "height_max", null: false
    t.float "spread_min", null: false
    t.float "spread_max", null: false
    t.string "bloom_start", null: false
    t.string "bloom_end", null: false
    t.string "bloom_color", null: false
    t.string "light_min", null: false
    t.string "light_max", null: false
    t.string "soil_texture", null: false
    t.string "soil_ph", null: false
    t.integer "status", limit: 1, default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["common_name"], name: "index_plants_on_common_name", unique: true
    t.index ["family_id"], name: "index_plants_on_family_id"
    t.index ["name"], name: "index_plants_on_name", unique: true
    t.index ["sci_name"], name: "index_plants_on_sci_name", unique: true
    t.check_constraint "height_max > 0.0"
    t.check_constraint "height_min > 0.0"
    t.check_constraint "spread_max > 0.0"
    t.check_constraint "spread_min > 0.0"
  end

  create_table "samples", force: :cascade do |t|
    t.string "name", null: false
    t.string "title", null: false
    t.decimal "price", default: "0.0", null: false
    t.integer "quantity", default: 0, null: false
    t.integer "position"
    t.integer "status", limit: 1, default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_samples_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.integer "role", limit: 1, default: 0, null: false
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "remember_digest"
    t.integer "status", limit: 1, default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name", null: false
    t.string "title", null: false
    t.string "address"
    t.string "phone"
    t.string "url"
    t.string "about"
    t.integer "status", limit: 1, default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_vendors_on_name", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "plants", "families"
end
