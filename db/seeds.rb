# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Adicionando Tags"
10.times do
  Tag.create!(description: Faker::Computer.stack)
end
puts "Tags adicionadas com sucesso!"
puts "+++++++++++++++++++++++++++++"
puts "Adicionando Artigos"
10.times do
  Article.create!(
    title: Faker::Company.catch_phrase,
    body: Faker::Lorem.paragraph(sentence_count: 2)
  )
end
puts "Artigos adicionados com sucesso!"
