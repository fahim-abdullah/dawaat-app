# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.development?
  puts ''
  puts 'Runnning db/seed.rb'

  Product.create(name: 'Signature Tehari', price: 120, status: 'Available')
  Product.create(name: 'Chicken Tehari', price: 100, status: 'Available')
  Product.create(name: 'Fried Chicken Roast & Pulao', price: 110, status: 'Available')
  Product.create(name: 'Firni (Regular)', price: 130, status: 'Available')
  Product.create(name: 'Firni (Large)', price: 150, status: 'Available')
  
  User.create(name: 'User', username: 'user', password: '123')
  puts 'Completed seed data'
  puts ''
else
  puts "This is #{Rails.env} environment"
  puts 'You can run seed data only in develpment environment.'
end