class CreateInstituicaos < ActiveRecord::Migration[6.1]
  def change
    create_table :instituicaos do |t|
      t.string :nome_instituicao
      t.string :cnpj
      t.string :tipo

      t.timestamps
    end
  end
end