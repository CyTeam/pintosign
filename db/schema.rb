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

ActiveRecord::Schema.define(version: 20140824140033) do

  create_table "kuhsaft_assets", force: true do |t|
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kuhsaft_brick_types", force: true do |t|
    t.string   "class_name"
    t.string   "group"
    t.boolean  "enabled",    default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kuhsaft_bricks", force: true do |t|
    t.integer  "position"
    t.integer  "brick_list_id"
    t.string   "brick_list_type"
    t.string   "type"
    t.string   "locale"
    t.text     "text"
    t.text     "read_more_text"
    t.string   "caption"
    t.text     "href"
    t.string   "link_style"
    t.integer  "partitioning"
    t.string   "image"
    t.string   "image_size"
    t.text     "embed_src"
    t.string   "video"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "template_name"
    t.text     "display_styles"
    t.string   "asset"
    t.boolean  "open_in_new_window"
    t.string   "alt_text"
    t.integer  "col_count",          default: 0
  end

  create_table "kuhsaft_ckimages", force: true do |t|
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kuhsaft_pages", force: true do |t|
    t.integer  "position"
    t.string   "title_en"
    t.string   "title_de"
    t.string   "slug_en"
    t.string   "slug_de"
    t.string   "keywords_en"
    t.string   "keywords_de"
    t.text     "description_en"
    t.text     "description_de"
    t.text     "body_en"
    t.text     "body_de"
    t.integer  "published"
    t.integer  "page_id"
    t.text     "url_en"
    t.text     "url_de"
    t.string   "page_type",          default: "content"
    t.text     "fulltext_en"
    t.text     "fulltext_de"
    t.string   "ancestry"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "redirect_url_en"
    t.text     "redirect_url_de"
    t.text     "redirect_url_de_ch"
    t.text     "page_title_en"
    t.text     "page_title_de"
    t.string   "identifier"
  end

  add_index "kuhsaft_pages", ["ancestry"], name: "index_kuhsaft_pages_on_ancestry", using: :btree
  add_index "kuhsaft_pages", ["identifier"], name: "index_kuhsaft_pages_on_identifier", unique: true, using: :btree
  add_index "kuhsaft_pages", ["published"], name: "index_kuhsaft_pages_on_published", using: :btree

end
