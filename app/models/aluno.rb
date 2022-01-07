class Aluno < ApplicationRecord
  has_many :matriculas, dependent: :destroy # depois de excluir um aluno as matriculas relacionadas a esse aluno também serão excluidas
  validates :nome, presence: true, uniqueness: true
  validates :cpf, presence: true, uniqueness: true, numericality: { only_integer: true }, length: { is: 11 }
  validates :telefone, numericality: { only_integer: true }
  validates :genero, presence: true, inclusion: { in: %w[M F] }
  validates :meio_pagamento, presence: true, inclusion: { in: %w[Boleto Cartao boleto cartao cartão Cartão] }
end
