class Instituicao < ApplicationRecord
  has_many :matriculas, dependent: :destroy # depois de excluir a instituicao as matriculas relacionadas a essa instituica serão excluidas também 
  validates :nome_instituicao, presence: true, uniqueness: true
  validates :cnpj, presence: true, uniqueness: true, numericality: { only_integer: true }, length: { is: 14 }
  validates :tipo, presence: true, inclusion: { in: %w[Universidade Escola Creche] }
end
