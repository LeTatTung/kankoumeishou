# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create! name: "カオ・ヴァン・ミン", email: "minhcvbachkhoa@gmail.com",
  password: "minhcv", password_confirmation: "minhcv", admin: true

User.create! name: "レー・タット・トゥン", email: "tunglt@gmail.com",
  password: "tunglt", password_confirmation: "tunglt", admin: true

20.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create! name: name, email: email, password: password,
    password_confirmation: password
end

Category.create!([{name: "山岳"}, {name: "洞窟"}, {name: "海"}])

#image url : /uploads/image/image/3/anh-dep-thien-nhien-day-lang-man-1.jpg
users = User.all
user = users.first
following = users[2..15]
followers = users[3..10]
following.each {|followed| user.follow followed}
followers.each {|follower| follower.follow user}
