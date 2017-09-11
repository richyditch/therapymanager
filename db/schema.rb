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

ActiveRecord::Schema.define(version: 20170906010716) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "address_books", force: :cascade do |t|
    t.text     "name"
    t.date     "dob"
    t.text     "address_line1"
    t.text     "address_line2"
    t.text     "postcode"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "clients", force: :cascade do |t|
    t.text    "client_name"
    t.integer "default_rate_pence"
  end

  create_table "invoices", force: :cascade do |t|
    t.integer  "client_id"
    t.datetime "date_raised"
    t.string   "description"
    t.integer  "total_pence"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["client_id"], name: "index_invoices_on_client_id", using: :btree
  end

  create_table "therapists", force: :cascade do |t|
    t.text    "therapist_name"
    t.text    "default_location"
    t.integer "default_rate_pence"
  end

  create_table "therapysessions", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "therapist_id"
    t.integer  "invoice_id"
    t.datetime "session_started_at"
    t.integer  "session_duration_minutes", default: 50
    t.text     "location"
    t.integer  "fee_pence"
    t.boolean  "new_client_assessment",    default: false
    t.boolean  "did_not_attend",           default: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["client_id"], name: "index_therapysessions_on_client_id", using: :btree
    t.index ["invoice_id"], name: "index_therapysessions_on_invoice_id", using: :btree
    t.index ["therapist_id"], name: "index_therapysessions_on_therapist_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "associated_therapist_id"
    t.boolean  "is_admin"
  end

end
