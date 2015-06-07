require 'faker'

# Create Users
5.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save!
end
users = User.all

# Create Items
20.times do
  Item.create!(
    user: users.sample,
    name: Faker::Lorem.sentence
    )  
end
posts = Item.all 

user = User.new(
  name: "Nicole De La Rosa",
  email: 'nicoledelarosa616@gmail.com',
  password: 'monkey324'
  )
user.skip_confirmation!
user.save!

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"




