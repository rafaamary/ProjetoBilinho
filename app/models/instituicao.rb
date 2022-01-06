class Instituicao < ApplicationRecord
    has_many :matricula
    validates :nome_instituicao, presence: true, uniqueness: true
    validates :cnpj, presence: true, uniqueness: true, numericality: { only_integer: true }
    validates :tipo, presence: true, inclusion: { in: %w(Universidade Escola Creche)}
end
