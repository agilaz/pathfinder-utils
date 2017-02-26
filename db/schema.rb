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

ActiveRecord::Schema.define(version: 20170226001350) do

  create_table "abilities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "max_uses"
    t.integer  "uses_left"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "character_id"
    t.index ["character_id"], name: "index_abilities_on_character_id", using: :btree
  end

  create_table "characters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "char_class"
    t.integer  "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spells", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "sorcerer"
    t.integer  "wizard"
    t.integer  "cleric"
    t.integer  "druid"
    t.integer  "ranger"
    t.integer  "bard"
    t.integer  "paladin"
    t.integer  "alchemist"
    t.integer  "summoner"
    t.integer  "witch"
    t.integer  "inquisitor"
    t.integer  "oracle"
    t.integer  "antipaladin"
    t.integer  "magus"
    t.integer  "adept"
    t.integer  "bloodrager"
    t.integer  "shaman"
    t.integer  "psychic"
    t.integer  "medium"
    t.integer  "mesmerist"
    t.integer  "occultist"
    t.integer  "spiritualist"
    t.integer  "skald"
    t.integer  "investigator"
    t.integer  "hunter"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
