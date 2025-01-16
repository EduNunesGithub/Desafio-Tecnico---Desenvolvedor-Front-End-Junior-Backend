Faker::Config.locale = 'pt-BR'

# Criando Companies
10.times do |i|
  Company.create!(
    address: "Rua #{Faker::Address.street_name}",
    cnpj: Faker::Company.brazilian_company_number,
    company_name: Faker::Company.name,
    phone: Faker::PhoneNumber.phone_number,
    whatsapp: Faker::PhoneNumber.cell_phone
  )
  puts "Empresa #{i} criada com sucesso"
end

# Criando Vehicles
10.times do
  Vehicle.create!(
    name: Faker::Vehicle.model,
    price: Faker::Commerce.price(range: 50000.0..200000.0),
    subheading: Faker::Lorem.sentence,
    video: "https://www.youtube.com/embed/#{Faker::Lorem.characters(number: 11)}?si=#{Faker::Lorem.characters(number: 8)}&controls=0",
    description: {
      heading: Faker::Lorem.sentence(word_count: 5),
      paragraph: Faker::Lorem.paragraph(sentence_count: 4)
    },
    features: {
      consumption: "#{Faker::Number.decimal(l_digits: 2, r_digits: 1)} km/l",
      engine: "#{Faker::Number.number(digits: 4)} cm3",
      power: "#{Faker::Number.number(digits: 2)} cv",
      speed: "#{Faker::Number.number(digits: 3)} km/h"
    },
    image: {
      mobile: "https://raw.githubusercontent.com/EduNunesGithub/Desafio-Tecnico---Desenvolvedor-Front-End-Junior/refs/heads/main/public/Car%20Small.webp",
      desktop: "https://raw.githubusercontent.com/EduNunesGithub/Desafio-Tecnico---Desenvolvedor-Front-End-Junior/refs/heads/main/public/Car.webp"
    },
    legal_text: Faker::Lorem.paragraph,
  )
end
