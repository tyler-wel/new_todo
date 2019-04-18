# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



user1 = User.create!(username: "Tester",
  email: "email@gmail.com",
  password: "foobar",
  admin: true)

user2 = User.create!(username: "Boi",
  email: "email2@gmail.com",
  password: "foobar",)

user3 = User.create(username: "User Three",
    email: "email3@gmail.com",
    password: "foobar")

user4 = User.create(username: "User Four", 
    email: "email4@gmail.com", 
    password: "foobar")

project_board = user1.boards.create!( { name: "Project Board", 
            description: "Our team's current project" } )
project_board.make_owner!(user1)
project_board.users << user2
project_board.users << user3
project_board.users << user4

user3_party = user3.boards.create!( { name: "Birthday Party!",
            description: "Let's have a party!"})
user3_party.make_owner!(user3)
user3_party.users << user1

user1_notes = user1.boards.create!( { name: "Personal Tasks",
            description: "My personal tasks"})
user1_notes.make_owner!(user1)