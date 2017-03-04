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

ActiveRecord::Schema.define(version: 20170304203822) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attractions", force: :cascade do |t|
    t.string  "name"
    t.integer "destination_id"
    t.text    "about"
    t.string  "slug"
    t.text    "excerpt"
    t.string  "website"
    t.index ["destination_id"], name: "index_attractions_on_destination_id", using: :btree
    t.index ["slug"], name: "index_attractions_on_slug", unique: true, using: :btree
  end

  create_table "destinations", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "state"
    t.text   "about"
    t.string "slug"
    t.text   "excerpt"
    t.index ["slug"], name: "index_destinations_on_slug", unique: true, using: :btree
  end

  create_table "destinations_photos", force: :cascade do |t|
    t.integer "photo_id"
    t.integer "destination_id"
    t.index ["destination_id"], name: "index_destinations_photos_on_destination_id", using: :btree
    t.index ["photo_id"], name: "index_destinations_photos_on_photo_id", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "photos", force: :cascade do |t|
    t.string "image"
    t.string "name"
    t.text   "description"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "status"
    t.boolean  "featured"
    t.string   "slug"
    t.text     "excerpt"
    t.datetime "publish_date"
    t.index ["slug"], name: "index_posts_on_slug", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "attractions", "destinations"
  add_foreign_key "destinations_photos", "destinations"
  add_foreign_key "destinations_photos", "photos"
end
