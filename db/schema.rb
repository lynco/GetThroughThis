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

ActiveRecord::Schema.define(version: 20140710224033) do

  create_table "download_urls", force: true do |t|
    t.string  "url"
    t.integer "web_service_id"
    t.string  "link_type"
  end

  create_table "images", force: true do |t|
    t.string   "name"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_file_name"
    t.string   "image_file_content_type"
    t.integer  "image_file_file_size"
    t.datetime "image_file_updated_at"
  end

  create_table "languages", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages_web_services", force: true do |t|
    t.integer "language_id"
    t.integer "web_service_id"
  end

  add_index "languages_web_services", ["language_id"], name: "index_languages_web_services_on_language_id"
  add_index "languages_web_services", ["web_service_id"], name: "index_languages_web_services_on_web_service_id"

  create_table "navbar_entries", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "page_attributes", force: true do |t|
    t.string  "key"
    t.text    "value"
    t.integer "page_id"
  end

  create_table "pages", force: true do |t|
    t.string "template"
    t.string "layout"
    t.string "slug"
  end

  create_table "service_use_modes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_use_modes_web_services", force: true do |t|
    t.integer "service_use_mode_id"
    t.integer "web_service_id"
  end

  add_index "service_use_modes_web_services", ["service_use_mode_id"], name: "index_service_use_modes_web_services_on_service_use_mode_id"
  add_index "service_use_modes_web_services", ["web_service_id"], name: "index_service_use_modes_web_services_on_web_service_id"

  create_table "tags", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags_web_services", force: true do |t|
    t.integer "tag_id"
    t.integer "web_service_id"
  end

  add_index "tags_web_services", ["tag_id"], name: "index_tags_web_services_on_tag_id"
  add_index "tags_web_services", ["web_service_id"], name: "index_tags_web_services_on_web_service_id"

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.integer  "age"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "web_service_relations", force: true do |t|
    t.integer "first_web_service_id"
    t.integer "second_web_service_id"
  end

  create_table "web_services", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
