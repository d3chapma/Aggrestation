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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120124185047) do

  create_table "feed_entries", :force => true do |t|
    t.string   "name"
    t.text     "summary"
    t.string   "url"
    t.datetime "published_at"
    t.string   "guid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content"
  end

  create_table "feeds", :force => true do |t|
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "etag"
    t.datetime "last_modified"
    t.string   "last_entry_url"
  end

  create_table "filters", :force => true do |t|
    t.integer  "feed_id"
    t.integer  "keyword_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "keywords", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
