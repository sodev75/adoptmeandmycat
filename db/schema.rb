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

ActiveRecord::Schema.define(version: 20160807173830) do

  create_table "age_preferences", force: :cascade do |t|
    t.string   "age_range"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "profil_id"
    t.integer  "profil_like_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["profil_id"], name: "index_likes_on_profil_id"
    t.index ["profil_like_id"], name: "index_likes_on_profil_like_id"
  end

  create_table "lovers", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "profil_id_id"
    t.integer  "profil_two_id_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["profil_id_id"], name: "index_matches_on_profil_id_id"
    t.index ["profil_two_id_id"], name: "index_matches_on_profil_two_id_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string   "content"
    t.integer  "profil_recipient_id_id"
    t.integer  "profil_sender_id_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["profil_recipient_id_id"], name: "index_messages_on_profil_recipient_id_id"
    t.index ["profil_sender_id_id"], name: "index_messages_on_profil_sender_id_id"
  end

  create_table "preferences", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profils", force: :cascade do |t|
    t.string   "name"
    t.string   "age"
    t.string   "hobbies"
    t.string   "sexe"
    t.string   "catname"
    t.string   "colorcat"
    t.string   "coloreyes"
    t.string   "hair"
    t.string   "message"
    t.string   "picture"
    t.string   "city"
    t.integer  "lover_id"
    t.integer  "preference_id"
    t.integer  "age_preference_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["age_preference_id"], name: "index_profils_on_age_preference_id"
    t.index ["lover_id"], name: "index_profils_on_lover_id"
    t.index ["preference_id"], name: "index_profils_on_preference_id"
  end

end
