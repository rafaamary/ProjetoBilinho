class Matricula < ApplicationRecord
    belongs_to :aluno
    belongs_to :instituicao
    has_many :faturas
    validates :valor_total_curso, presence: true, numericality: { greater_than: 0}
    validates :quantidade_faturas, presence: true, numericality: { greater_than_or_equal_to: 1}
    validates :dia_venc_fatura, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 31}
    validates :nome_curso, presence: true
    after_create :criar_faturas
    
    private

    def criar_faturas
        valor_fatura = self.valor_total_curso/self.quantidade_faturas
        data_atual = DateTime.now.to_date # data atual
        dia_atual = data_atual.day
        if dia_venc_fatura <= dia_atual
            # primeira fatura no proximo mes
            data_vencimento = data_atual.next_month.strftime("#{dia_venc_fatura}/%m/%Y").to_date
        else
            # primeira fatura no mes atual
            data_vencimento = data_atual.strftime("#{dia_venc_fatura}/%m/%Y").to_date    # data_vencimento -> data da primeira fatura apenas
        end
        Fatura.create!(valor_fatura: valor_fatura, data_vencimento: data_vencimento, matricula_id: self.id, status: "Aberta")
        qtd = 1 # só para limitar a quantidade de vezes que ira repetir
        while qtd < self.quantidade_faturas do
            data_fatura_venc = Date.new(data_vencimento.year,data_vencimento.month,data_vencimento.day).next_month(qtd)
            qtd += 1
            Fatura.create!(valor_fatura: valor_fatura, data_vencimento: data_fatura_venc, matricula_id: self.id, status: "Aberta")
        end
    end
end