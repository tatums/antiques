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

ActiveRecord::Schema.define(:version => 20121027174312) do

  create_table "categories", :force => true do |t|
    t.boolean  "active",      :default => false
    t.string   "title"
    t.text     "description"
    t.integer  "position"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "slug"
  end

  create_table "category_products", :force => true do |t|
    t.integer  "category_id"
    t.integer  "product_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "position"
  end

  create_table "contact_groups", :force => true do |t|
    t.integer  "contact_id"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contacts", :force => true do |t|
    t.string   "first"
    t.string   "last"
    t.string   "email"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "phone"
    t.text     "note"
    t.string   "country"
  end

  create_table "groups", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "images", :force => true do |t|
    t.string   "image"
    t.integer  "product_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "invoices", :force => true do |t|
    t.string   "title"
    t.integer  "contact_id"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "inv_number"
    t.text     "notes"
    t.date     "inv_date"
    t.decimal  "tax"
    t.string   "price_header"
    t.decimal  "shipping",     :precision => 8, :scale => 2
  end

  create_table "keywords", :force => true do |t|
    t.string   "title"
    t.integer  "product_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "line_items", :force => true do |t|
    t.integer  "position"
    t.integer  "product_id"
    t.string   "item_number"
    t.string   "description"
    t.string   "dimensions"
    t.integer  "quantity"
    t.decimal  "price"
    t.decimal  "tax"
    t.decimal  "total"
    t.integer  "invoice_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "notes", :force => true do |t|
    t.text     "body"
    t.integer  "notable_id"
    t.string   "notable_type"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "products", :force => true do |t|
    t.boolean  "active",                                        :default => true
    t.string   "title"
    t.text     "body"
    t.string   "image"
    t.integer  "position"
    t.datetime "created_at",                                                       :null => false
    t.datetime "updated_at",                                                       :null => false
    t.boolean  "phoebe_find",                                   :default => false
    t.boolean  "new_acquisition",                               :default => false
    t.string   "country"
    t.string   "period"
    t.integer  "item_number"
    t.decimal  "price",           :precision => 8, :scale => 2
    t.string   "dimensions"
    t.boolean  "sold",                                          :default => false
  end

  create_table "shows", :force => true do |t|
    t.boolean  "active"
    t.string   "title"
    t.string   "url"
    t.string   "dates"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sliders", :force => true do |t|
    t.boolean  "active",     :default => true
    t.string   "image"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "product_id"
    t.integer  "position"
    t.string   "title"
  end

  create_table "tasks", :force => true do |t|
    t.boolean  "completed"
    t.string   "title"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.text     "description"
    t.integer  "position"
    t.boolean  "deployed",    :default => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password"
    t.integer  "sign_in_count"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "password_salt"
    t.boolean  "show_tooltips"
  end

end
