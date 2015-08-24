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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150823175850) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "culturas", force: :cascade do |t|
    t.string   "nome"
    t.boolean  "anual"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fazendas", force: :cascade do |t|
    t.string   "nome"
    t.float    "custo_kwh"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "latitude"
  end

  create_table "lotes", force: :cascade do |t|
    t.integer  "fazenda_id"
    t.integer  "cultura_id"
    t.integer  "sistema_irrigacao_id"
    t.date     "iniciou_em"
    t.float    "vazao_litro_hora"
    t.float    "raio_copa"
    t.integer  "quantidade_plantas"
    t.float    "espacamento_plantas"
    t.float    "espacamento_linhas"
    t.float    "consumo_bomba_kwh"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "lotes", ["cultura_id"], name: "index_lotes_on_cultura_id", using: :btree
  add_index "lotes", ["fazenda_id"], name: "index_lotes_on_fazenda_id", using: :btree
  add_index "lotes", ["sistema_irrigacao_id"], name: "index_lotes_on_sistema_irrigacao_id", using: :btree

  create_table "sistema_irrigacaos", force: :cascade do |t|
    t.string   "nome"
    t.float    "coeficiente_eficiencia"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "lotes", "culturas"
  add_foreign_key "lotes", "fazendas"
  add_foreign_key "lotes", "sistema_irrigacaos"
end
