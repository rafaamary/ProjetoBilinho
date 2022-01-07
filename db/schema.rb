# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_211_220_144_818) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'alunos', force: :cascade do |t|
    t.string 'nome'
    t.string 'cpf'
    t.date 'data_nascimento'
    t.string 'telefone'
    t.string 'genero'
    t.string 'meio_pagamento'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'faturas', force: :cascade do |t|
    t.float 'valor_fatura'
    t.date 'data_vencimento'
    t.bigint 'matricula_id', null: false
    t.string 'status'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['matricula_id'], name: 'index_faturas_on_matricula_id'
  end

  create_table 'instituicaos', force: :cascade do |t|
    t.string 'nome_instituicao'
    t.string 'cnpj'
    t.string 'tipo'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'matriculas', force: :cascade do |t|
    t.float 'valor_total_curso'
    t.integer 'quantidade_faturas'
    t.integer 'dia_venc_fatura'
    t.string 'nome_curso'
    t.bigint 'instituicao_id', null: false
    t.bigint 'aluno_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['aluno_id'], name: 'index_matriculas_on_aluno_id'
    t.index ['instituicao_id'], name: 'index_matriculas_on_instituicao_id'
  end

  add_foreign_key 'faturas', 'matriculas'
  add_foreign_key 'matriculas', 'alunos'
  add_foreign_key 'matriculas', 'instituicaos'
end
