# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: "fanny@mail.com", password: '1234')
User.create(email: "gaby@mail.com", password: '1234')
p "#{User.count} user(s) created"

UserContact.create(first_name: "fanny", last_name: "ibanez", user_id: 1)
UserContact.create(first_name: "gabriel", last_name: "ibanez", user_id: 2)
p "#{UserContact.count} user(s) created"
