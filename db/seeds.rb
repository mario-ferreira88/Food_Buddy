require "open-uri"

puts 'Cleaning database...'
# Clear existing data
Event.destroy_all
Restaurant.destroy_all

puts "Creating addresses"
addresses = [
  'R. da Atalaia 153, 1200-039 Lisboa',
  'R. da Rosa 51, 1200-382 Lisboa',
  'R. do Comércio 111, 1100-150 Lisboa',
  'Rua da Prata 242, 1100-052 Lisboa',
  'R. Dom Pedro V Nº56-D, 1250-094 Lisboa',
  'R. Luciano Cordeiro 58D, 1150-216 Lisboa',
  'R. São Sebastião da Pedreira 51 C, 1050-208 Lisboa',
  'Largo de São Sebastião da Pedreira 49, 1050-010 Lisboa',
  'R. da Escola Politécnica 40, 1250-102 Lisboa',
  'Rua de Santa Apolónia 59, 1100-468 Lisboa',
  'R. da Madalena 57, 1100-319 Lisboa',
  'R. de Sant\'Ana à Lapa 33, 1200-796 Lisboa',
  'Rua de Ponta Delgada 80B, 1000-244 Lisboa',
  'Calçada Poço dos Mouros 28, 1170-318 Lisboa',
  'R. Nova da Piedade 62, 1200-299 Lisboa',
  'Av. de Paris 15B, 1000-227 Lisboa',
  'Av. Barbosa du Bocage 38, 1000-072 Lisboa',
  'R. do Centro Cultural 45, 1700-006 Lisboa',
  'R. Roberto Duarte Silva 2A, 1600-200 Lisboa',
  'Av. Mediterrâneo 1 12.04, 1990-221 Lisboa',
  'R. de Belém 36, 1300-083 Lisboa',
  'Largo da Ajuda, 1349-021 Lisboa',
  'R. Rodrigues de Faria 103, 1300-501 Lisboa',
  'R. Roberto Duarte Silva 2A, 1600-200 Lisboa',
  'R. Correia Teles nº63, 1350-095 Lisboa',
  'CC da Quintinha 6, 1070-225 Lisboa',
  'Praça das Amoreiras 10, 1250-020 Lisboa',
  'Av. da Liberdade 185, 1250-147 Lisboa',
  'Calçada do Combro 45, 1200-114 Lisboa',
  'R. dos Bacalhoeiros 26A, 1100-585 Lisboa',
  'R. Nova da Piedade 64A, 1200-299 Lisboa',
  'Beco da Lapa 31, 1100-331 Lisboa',
  'Largo Monte, 1170-253 Lisboa',
  'R. Rodrigo da Fonseca 79 C, 1250-190 Lisboa',
  'Largo Rafael Bordalo Pinheiro 30, 1200-369 Lisboa',
  'Praça dos Restauradores 58, 1150-265 Lisboa',
  'R. de São João da Praça 95, 1100-519 Lisboa',
  'Estr. Alvito, Lisboa',
  'Av. Dr. Arlindo Vicente 406, Lisboa',
  'Rua de Ovar, 1950-214 Lisboa',
  'Rua da Manutenção 76, 1900-321 Lisboa',
  'Rua de Santa Engracia 8, 1170-333 Lisboa',
  'Rua do Forno do Tijolo 9A, 1170-132 Lisboa',
  'Av. Gen. Roçadas 3, 1170-340 Lisboa',
  'R. Febo Moniz 27A, 1150-152 Lisboa',
  'Cc dos Barbadinhos 136 Loja E, 1170-041 Lisboa',
  'Rua da Senhora da Glória 116A, 1170-354 Lisboa',
  'Alameda Dom Afonso Henriques, 1900-221 Lisboa',
  'Parada Alto de São João, 1900-053 Lisboa',
  'R. Me. Deus 4, 1900-312 Lisboa',
  'R. Angelina Vidal 5, 1170-166 Lisboa'
]

puts "Addresses Created"
puts "Creating categories"

categories = [
  '🌾 Gluten-Free',
  '🥜 Nut-Free',
  '🐚 Shellfish-Free',
  '🥚 Egg-Free',
  '🧀 Dairy-Free',
  '🐠 Fish-Free',
  '🌽 Corn-Free',
  '🥕 Vegetarian',
  '🥦 Vegan'
]

puts "Categories created"

puts "Building restaurants fotos"
restaurants_fotos = [
  "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1552566626-52f8b828add9?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://plus.unsplash.com/premium_photo-1674004585426-c6ad2adbe4c0?q=80&w=3132&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1555396273-367ea4eb4db5?q=80&w=3174&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1592861956120-e524fc739696?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1533777857889-4be7c70b33f7?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1550966871-3ed3cdb5ed0c?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://plus.unsplash.com/premium_photo-1670984935550-5ce2e220977a?q=80&w=3015&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1514933651103-005eec06c04b?q=80&w=3174&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1424847651672-bf20a4b0982b?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1528605248644-14dd04022da1?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1498654896293-37aacf113fd9?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1471253794676-0f039a6aae9d?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1599458448510-59aecaea4752?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1604328471151-b52226907017?q=80&w=2971&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1592417817038-d13fd7342605?q=80&w=2953&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1466978913421-dad2ebd01d17?q=80&w=3174&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
]


categories.each do |category|
  Category.create!(name: category)
end
# Generate 15 fake restaurants
addresses.each do |street_address|
  image_url = restaurants_fotos.sample
  file = URI.open(image_url)
  restaurant = Restaurant.new(name: Faker::Restaurant.name, address: street_address, website: Faker::Internet.url)
  restaurant.photo.attach(io: file, filename: "food.png", content_type: "image/png")
  restaurant.save!

  (2..5).to_a.sample.times do
    RestaurantCategory.create(restaurant_id: restaurant.id, category_id: Category.all.sample.id)
  end
  puts "#{restaurant.name} created"
end

puts "Seed data generated!"
