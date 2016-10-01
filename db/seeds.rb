# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name:  "admin", email: "admin@framgia.com",
  password: "123456", is_admin: true, password_confirmation: "123456")

20.times do |n|
  name  = Faker::Name.name
  email = "account-#{n+1}@railstutorial.org"
  password = "abc123"
  User.create!(name:  name,
    email: email,
    password: password,
    password_confirmation: password,
    is_admin: false)
end
