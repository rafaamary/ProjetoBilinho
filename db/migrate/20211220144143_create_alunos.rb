class CreateAlunos < ActiveRecord::Migration[6.1]
  def change
    create_table :alunos do |t|
      t.string :nome
      t.string :cpf
      t.date :data_nascimento
      t.string :telefone
      t.string :genero
      t.string :meio_pagamento

      t.timestamps
    end
  end
end
