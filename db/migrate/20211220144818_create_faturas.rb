class CreateFaturas < ActiveRecord::Migration[6.1]
  def change
    create_table :faturas do |t|
      t.float :valor_fatura
      t.date :data_vencimento
      t.references :matricula, foreign_key: true, null: false
      t.string :status

      t.timestamps
    end
  end
end