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

ActiveRecord::Schema.define(:version => 20120613141938) do

  create_table "passets", :force => true do |t|
    t.integer  "pcontent_id"
    t.string   "media_passet_file_name"
    t.string   "caption"
    t.text     "markup"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "pbehaviors", :force => true do |t|
    t.integer  "pcontent_id"
    t.integer  "pevent_id"
    t.integer  "pfragment_id"
    t.text     "markup"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "prev_pcontent_id"
    t.integer  "delay"
  end

  create_table "pcontents", :force => true do |t|
    t.integer  "pslide_id"
    t.integer  "psection_id"
    t.text     "markup"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "pevents", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pfragments", :force => true do |t|
    t.string   "name"
    t.text     "markup"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "presentations", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "markup"
  end

  create_table "presentations_pslides", :force => true do |t|
    t.integer  "presentation_id"
    t.integer  "pslide_id"
    t.integer  "sequence_number"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "psections", :force => true do |t|
    t.integer  "ptemplate_id"
    t.integer  "pwidget_id"
    t.text     "markup"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "pslides", :force => true do |t|
    t.integer  "user_id"
    t.integer  "ptemplate_id"
    t.text     "markup"
    t.integer  "pbehavior_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.boolean  "in_bank",      :default => false
    t.string   "name"
  end

  create_table "ptemplates", :force => true do |t|
    t.string   "name"
    t.text     "markup"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.boolean  "uses_background_image", :default => false
  end

  create_table "pwidgets", :force => true do |t|
    t.string   "name"
    t.text     "builder"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.boolean  "admin"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
