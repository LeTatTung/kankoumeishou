# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create! name: "Cao Van Minh", email: "minhcv@gmail.com",
  password: "minhcv", password_confirmation: "minhcv", admin: true, sex: 0

User.create! name: "Le Tat Tung", email: "tunglt@gmail.com",
  password: "tunglt", password_confirmation: "tunglt", admin: true, sex: 0

User.create! name: "Phan Anh Trung", email: "trungpa@gmail.com",
  password: "trungpa", password_confirmation: "trungpa", admin: true, sex: 0

User.create! name: "Nguyen Dinh Chinh", email: "chinhnd@gmail.com",
  password: "chinhnd", password_confirmation: "chinhnd", admin: true, sex: 0

User.create! name: "Duong Cong Nguyen", email: "nguyendc@gmail.com",
  password: "nguyendc", password_confirmation: "nguyendc", admin: true, sex: 0

User.create! name: "Example User", email: "example@gmail.com",
  password: "foobar", password_confirmation: "foobar", admin: true, sex: 1

50.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  sex = Random.rand(2)
  User.create! name: name, email: email, password: password,
    password_confirmation: password, sex: sex
end

Category.create!([{name: "Mountain"}, {name: "Cave"}, {name: "Sea"},
  {name: "Bay"}, {name: "Pagoda"}, {name: "Historical monuments"}])

users = User.all
user = users.first
user1 = User.find(2)
following = users[3..40]
followers = users[3..30]
following.each do |followed| 
  user.follow followed
  user1.follow followed
end

followers.each do |follower|
  follower.follow user
  follower.follow user1
end
