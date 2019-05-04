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

ActiveRecord::Schema.define(version: 2019_04_20_051814) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", id: :bigint, default: -> { "nextval('customer_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "customer_name"
    t.string "email"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_lists", id: :bigint, default: -> { "nextval('order_list_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "order_seq"
    t.string "product_id"
    t.float "unit_price"
    t.float "qty"
    t.float "amount"
    t.float "tax"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orderds", id: :bigint, default: -> { "nextval('orderd_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "customer_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", id: :bigint, default: -> { "nextval('product_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "product_name1"
    t.string "product_name2"
    t.float "unit_price"
    t.float "stock_qty"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "send_mails", id: :bigint, default: -> { "nextval('send_mail_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "to_add"
    t.string "cc_add"
    t.string "secret_add"
    t.string "title"
    t.string "article"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
