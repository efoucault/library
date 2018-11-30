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

ActiveRecord::Schema.define(version: 2018_11_30_080552) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "emprunts", force: :cascade do |t|
    t.date "date_debut"
    t.date "date_fin"
    t.text "avis"
    t.integer "note"
    t.bigint "user_id"
    t.bigint "livre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["livre_id"], name: "index_emprunts_on_livre_id"
    t.index ["user_id"], name: "index_emprunts_on_user_id"
  end

  create_table "livres", force: :cascade do |t|
    t.string "titre"
    t.string "auteur"
    t.text "description"
    t.string "video"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "pochette"
    t.index ["user_id"], name: "index_livres_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nom"
    t.string "prenom"
    t.string "photo"
    t.boolean "livre_emprunte", default: true
    t.boolean "livre_rendu", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "emprunts", "livres"
  add_foreign_key "emprunts", "users"
  add_foreign_key "livres", "users"
end
