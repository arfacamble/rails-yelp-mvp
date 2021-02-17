# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'deleting restaurants'
Restaurant.destroy_all
puts 'making 10 new restos'
10.times do
  restaurant = Restaurant.new(
    name: Faker::Quotes::Shakespeare.as_you_like_it_quote,
    address: Faker::Address.full_address,
    category: %w[chinese italian japanese french belgian].sample
  )
  puts "saving #{restaurant.name}"
  restaurant.save
  rand(1..2).times do
    review = Review.new(
      content: Faker::Quotes::Shakespeare.king_richard_iii_quote,
      rating: rand(0..5)
    )
    review.restaurant = restaurant
    puts 'saving review'
    review.save
  end
end
