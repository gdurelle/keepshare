# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Rails.env.development?
  user = User.create email: 'user@test.com', password: 'user'
  User.create email: 'guest@test.com', password: 'guest', role: 'guest'
  User.create email: 'admin@test.com', password: 'admin', role: 'admin'

  list = List.create name: "My List", user_id: user.id
  Item.create list_id: list.id, content: 'Lorem ipsum'
  Item.create list_id: list.id, content: 'dolor sit amet'
  Item.create list_id: list.id, content: 'consectur'
end
