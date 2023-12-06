require "open-uri"

puts 'Cleaning database...'
# Clear existing data
# Event.destroy_all
Restaurant.destroy_all

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
]

categories = [
  'Gluten-Free',
  'Lactose-Free',
  'Nut-Free',
  'Soy-Free',
  'Shellfish-Free',
  'Egg-Free',
  'Dairy-Free',
  'Wheat-Free',
  'Fish-Free',
  'Corn-Free',
  'Vegetarian',
  'Vegan',
  'Kosher',
  'Halal'
]

categories.each do |category|
  Category.create!(name: category)
end
# Generate 15 fake restaurants
addresses.each do |address|
  image_url = "https://picsum.photos/400/300?random=#{rand(1..1000)}"

  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: address,
    website: Faker::Internet.url
  )
  file = URI.open(image_url)
  restaurant.photo.attach(io: file, filename: "#{restaurant.name}.png", content_type: "image/png")
  restaurant.save

  (4..7).to_a.sample.times do
    RestaurantCategory.create(restaurant_id: restaurant.id, category_id: Category.all.sample.id)
  end
end

puts "Seed data generated!"
