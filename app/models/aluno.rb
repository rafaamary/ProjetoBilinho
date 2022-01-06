class Aluno < ApplicationRecord
    has_many :matricula
    validates :nome, presence: true, uniqueness: true
    validates :cpf, presence: true, uniqueness: true, numericality: { only_integer: true }
    validates :telefone, numericality: { only_integer: true }
    validates :genero, presence: true, inclusion: { in: %w(M F)}
    validates :meio_pagamento, presence: true, inclusion: { in: %w(Boleto Cartao)}
end