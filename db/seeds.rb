# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

tristan = User.create(username: "tristan", password: "password")
dave = User.create(username: "dave", password: "123")

tristan.tasks.create(title: "Drop it like it's hot", details: "whatever")
dave.tasks.create([
  {title: "Get to the store", details: "so much pasta"},
  {title: "Eat a good breakfast", details: "protein, vegetable, pasta etc."},
  {title: "Make a rails app", details: "AirBnB, but with tents?"}
])