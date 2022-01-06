class CreateMatriculas < ActiveRecord::Migration[6.1]
  def change
    create_table :matriculas do |t|
      t.float :valor_total_curso
      t.integer :quantidade_faturas
      t.integer :dia_venc_fatura
      t.string :nome_curso
      t.references :instituicao, foreign_key: true, null: false
      t.references :aluno, foreign_key: true, null: false

      t.timestamps
    end
  end
end
