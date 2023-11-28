require "open-uri"

p 'Cleaning database...'
# Clear existing data
Restaurant.destroy_all

# Generate 15 fake restaurants
15.times do
  image_url = "https://picsum.photos/400/300?random=#{rand(1..1000)}"

  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    website: Faker::Internet.url
  )
  file = URI.open(image_url)
  restaurant.photo.attach(io: file, filename: "#{restaurant.name}.png", content_type: "image/png")
  restaurant.save
end

puts "Seed data generated successfully!"
