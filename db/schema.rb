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

ActiveRecord::Schema.define(:version => 20120818010034) do

  create_table "guests", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "addr1"
    t.string   "addr2"
    t.string   "addr3"
    t.string   "addr4"
    t.string   "phone"
    t.string   "mobile"
    t.string   "email"
  end

  create_table "reservations", :force => true do |t|
    t.date     "arrival_date"
    t.date     "departure_date"
    t.integer  "nights"
    t.integer  "guest_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

end
