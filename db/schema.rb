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

ActiveRecord::Schema.define(:version => 20130625011529) do

  create_table "comments", :force => true do |t|
    t.integer   "information_id"
    t.text      "comment_body"
    t.integer   "comment_user_id"
    t.timestamp "created_at",      :null => false
    t.timestamp "updated_at",      :null => false
  end

  create_table "highlights", :force => true do |t|
    t.string    "title"
    t.string    "video_url"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  create_table "information", :force => true do |t|
    t.string    "title"
    t.text      "infobody"
    t.string    "informant"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  create_table "matches", :force => true do |t|
    t.integer   "game_no"
    t.string    "team_a"
    t.integer   "score_a"
    t.string    "team_b"
    t.integer   "score_b"
    t.timestamp "created_at",  :null => false
    t.timestamp "updated_at",  :null => false
    t.string    "flag_a"
    t.string    "flag_b"
    t.string    "day"
    t.boolean   "done"
    t.string    "closingday"
    t.boolean   "close_flg"
    t.string    "game_status"
  end

  create_table "news", :force => true do |t|
    t.string    "news_body"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  create_table "part_one_predicts", :force => true do |t|
    t.integer   "game_no"
    t.integer   "score_a"
    t.integer   "score_b"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
    t.integer   "user_id"
    t.string    "closingday"
  end

  create_table "part_three_predicts", :force => true do |t|
    t.string   "team_a"
    t.string   "team_b"
    t.string   "team_c"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.integer  "score_a"
    t.integer  "score_b"
    t.integer  "score_c"
    t.integer  "score_d"
    t.integer  "score_e"
    t.integer  "score_f"
    t.integer  "score_g"
    t.integer  "score_h"
  end

  create_table "part_two_predicts", :force => true do |t|
    t.string    "team_a"
    t.string    "team_b"
    t.string    "team_c"
    t.string    "team_d"
    t.integer   "user_id"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  create_table "part_two_results", :force => true do |t|
    t.string    "team_a"
    t.string    "team_b"
    t.string    "team_c"
    t.string    "team_d"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string    "email",                                 :default => "", :null => false
    t.string    "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string    "reset_password_token"
    t.timestamp "reset_password_sent_at"
    t.timestamp "remember_created_at"
    t.integer   "sign_in_count",                         :default => 0
    t.timestamp "current_sign_in_at"
    t.timestamp "last_sign_in_at"
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.timestamp "created_at",                                            :null => false
    t.timestamp "updated_at",                                            :null => false
    t.string    "name"
    t.string    "account"
    t.integer   "total_point"
  end

  add_index "users", ["name"], :name => "index_users_on_name"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
