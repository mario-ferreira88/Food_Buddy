# require "open-uri"

puts 'Cleaning database...'
# Clear existing data
Event.destroy_all
Restaurant.destroy_all

addresses = [
  'R. da Atalaia 153, 1200-039 Lisboa',
  'R. da Rosa 51, 1200-382 Lisboa',
  'R. do Comércio 111, 1100-150 Lisboa',
  'Rua da Prata 242, 1100-052 Lisboa',
  'R. Dom Pedro V Nº56-D, 1250-094 Lisboa',
  'R. da Misericórdia 78, 1200-273 Lisboa',
  'R. da Moeda 1, 1200-109 Lisboa',
  'R. de São Paulo 99, 1200-429 Lisboa',
  'R. da Boavista 16, 1200-066 Lisboa',
  'R. da Oliveira ao Carmo 9, 1200-307 Lisboa',
  'R. São Boaventura 42, 1200-385 Lisboa',
  'R. Nova da Piedade 62, 1200-299 Lisboa',
  'Escolas Gerais 34, 1100-213 Lisboa',
  'R. Norberto de Araújo 18A, 1100-117 Lisboa',
  'R. da Misericórdia 71, 1200-365 Lisboa',
]

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
end

# puts "Seed data generated successfully!"
Category.create(name: 'Gluten-Free')
Category.create(name: 'Lactose-Free')
Category.create(name: 'Nut-Free')
Category.create(name: 'Soy-Free')
Category.create(name: 'Shellfish-Free')
Category.create(name: 'Egg-Free')
Category.create(name: 'Dairy-Free')
Category.create(name: 'Wheat-Free')
Category.create(name: 'Fish-Free')
Category.create(name: 'Corn-Free')
Category.create(name: 'Vegetarian')
Category.create(name: 'Vegan')
Category.create(name: 'Portuguese')
Category.create(name: 'Italian')
Category.create(name: 'Japanese')
Category.create(name: 'Chinese')
Category.create(name: 'Indian')
Category.create(name: 'Thai')
Category.create(name: 'Mexican')
Category.create(name: 'French')
Category.create(name: 'Spanish')
Category.create(name: 'Greek')
Category.create(name: 'Korean')
Category.create(name: 'Vietnamese')
Category.create(name: 'Brazilian')
Category.create(name: 'Asian')
Category.create(name: 'Steakhouse')
Category.create(name: 'Seafood')

RestaurantCategory.create(restaurant_id: 1, category_id: 1)
RestaurantCategory.create(restaurant_id: 1, category_id: 2)
RestaurantCategory.create(restaurant_id: 1, category_id: 10)
RestaurantCategory.create(restaurant_id: 1, category_id: 4)

RestaurantCategory.create(restaurant_id: 2, category_id: 2)
RestaurantCategory.create(restaurant_id: 2, category_id: 3)
RestaurantCategory.create(restaurant_id: 2, category_id: 6)
RestaurantCategory.create(restaurant_id: 2, category_id: 7)

RestaurantCategory.create(restaurant_id: 3, category_id: 4)
RestaurantCategory.create(restaurant_id: 3, category_id: 1)
RestaurantCategory.create(restaurant_id: 3, category_id: 8)
RestaurantCategory.create(restaurant_id: 3, category_id: 5)

RestaurantCategory.create(restaurant_id: 4, category_id: 3)
RestaurantCategory.create(restaurant_id: 4, category_id: 7)
RestaurantCategory.create(restaurant_id: 4, category_id: 8)
RestaurantCategory.create(restaurant_id: 4, category_id: 9)

RestaurantCategory.create(restaurant_id: 5, category_id: 1)
RestaurantCategory.create(restaurant_id: 5, category_id: 2)
RestaurantCategory.create(restaurant_id: 5, category_id: 4)
RestaurantCategory.create(restaurant_id: 5, category_id: 10)
