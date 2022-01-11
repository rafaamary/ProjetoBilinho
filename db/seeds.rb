# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# cria 10 alunos aleatorios
#5.times do
#  Aluno.create({
#                 nome: Faker::Name.name_with_middle,
#                 cpf: Faker::Number.number(digits: 11),
#                 data_nascimento: Faker::Date.birthday(min_age: 17, max_age: 80),
#                 telefone: Faker::Number.number(digits: 11),
#                 genero: %w[M F].sample,
#                 meio_pagamento: %w[Boleto Cartão].sample
#               })
#end

# cria 10 instituições aleatorias
#5.times do
#  tipo_instituicao = %w[Universidade Escola Creche].sample
#  Instituicao.create({
#                       nome_instituicao: "#{tipo_instituicao} #{Faker::University.name}",
#                       cnpj: Faker::Number.number(digits: 14),
#                       tipo: tipo_instituicao
#                     })
#end
