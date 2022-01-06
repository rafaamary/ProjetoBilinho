class Fatura < ApplicationRecord
    belongs_to :matricula
    validates :valor_fatura, presence: true
    validates :status, presence: true, inclusion: { in: %w(Aberta Atrasada Paga)}
end