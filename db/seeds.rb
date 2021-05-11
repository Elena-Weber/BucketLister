# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comment.destroy_all
Goal.destroy_all
Category.destroy_all
User.destroy_all

20.times do
    User.create(
    username: Faker::Internet.username,
    email: "email@email.com",
    location: Faker::Address.country,
    password: "password"
)
end

categories_list = ["travel", "study", "work", "money", "health", "hobby", "shopping", "people", "nature", "misc"]

categories_list.each do |category|
    Category.create(name: category)
end

30.times do
    Goal.create(
        content: ["visit Italy", "master JavaScript", "learn to dance tango", "have a daughter", "adopt a puppy", "save $1,000,000", "buy a new Mustang car", "workout every day", "find a new job", "meet Johnny Depp in person"].sample,
        details: ["I've wanted it all my life", "hopefully this year", "That's my dream", "it's really difficult but I want it so much", "I'll be so happy!", "What do you think, guys?", "May my dream come true soon!", "I'll be proud of myself", "I know I can do it", "I think it's doable"].sample,
        achieved: false,
        month: rand(1..12),
        user: User.all.sample,
        category: Category.all.sample
    )
end

50.times do
    Comment.create(
        content: ["WOW!", "Amazing goal!", "I like this one", "Great!", "Good luck!", "You can do it", "I believe in you!", "Cool!", "Super!", "Nice!"].sample,
        user: User.all.sample,
        goal: Goal.all.sample
    )
end

puts "Success"