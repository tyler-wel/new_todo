# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Mock Users #
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


# Mock Project Board #
project_board = user1.boards.create!( { name: "Project Board", 
            description: "Our team's current project" } )
project_board.make_owner!(user1)
project_board.users << user2
project_board.users << user3
project_board.users << user4
pb_cur_task = project_board.task_lists.create( { name: "Current Tasks" })
pb_fin_task = project_board.task_lists.create( { name: "Finished Tasks" })
pb_t1 = pb_cur_task.tasks.create( { name: "Finish Backend", 
  desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."})
pb_t2 = pb_cur_task.tasks.create( { name: "Finish Frontend",
  desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."})
pb_t3 = pb_fin_task.tasks.create( { name: "Hire new team members",
  desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."})

# Mock User3 Birthday Party Board #
user3_party = user3.boards.create!( { name: "Birthday Party!",
            description: "Let's have a party!"})
user3_party.make_owner!(user3)
user3_party.users << user1
up_to_buy = user3_party.task_lists.create( { name: "Party Guests" })
up_wishlist = user3_party.task_lists.create( { name: "Wishlist" })
up_t1 = up_to_buy.tasks.create({ name: "List of Guests",
  desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."})
up_t2 = up_wishlist.tasks.create({ name: "New Dress",
  desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."})
up_t3 = up_wishlist.tasks.create({ name: "New Hat",
  desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."})
up_t4 = up_wishlist.tasks.create({ name: "New Shoes",
  desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."})


# Mock User1 Personal Board #
user1_notes = user1.boards.create!( { name: "Personal Tasks",
            description: "My personal tasks"})
user1_notes.make_owner!(user1)
un_hw = user1_notes.task_lists.create( { name: "House Work" })
un_wr = user1_notes.task_lists.create( { name: "Work Related" })
un_t1 = un_hw.tasks.create({ name: "Clean Kitchen",
  desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."})
un_t2 = un_hw.tasks.create({ name: "Clean Bathroom",
  desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."})
un_t3 = un_hw.tasks.create({ name: "Clean Desk",
  desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."})
un_t4 = un_wr.tasks.create({ name: "Bring Umbrella",
  desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."})
un_t5 = un_wr.tasks.create({ name: "Buy Snacks",
  desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."})
