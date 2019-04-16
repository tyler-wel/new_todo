# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
test_user = User.create!(name: "Tester",
  email: "email@gmail.com",
  password: "foobar",
  admin: true)


boi_user = User.create!(name: "Boi",
  email: "email2@gmail.com",
  password: "foobar",)


work_board = test_user.boards.create!( { name: "Work Board", 
            description: "All tasks related to work", user_id: test_user.id } )
personal_board = test_user.boards.create!( { name: "Person Board", 
            description: "All my personal tasks.", user_id: boi_user.id})


work_board.users << boi_user