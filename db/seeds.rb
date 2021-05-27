# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts ">>>> Starting creating users..."
User.create(email: "fanny@mail.com", password: '1234')
User.create(email: "gaby@mail.com", password: '1234')
puts "#{User.count} user(s) created"

puts ">>>> Starting creating user_contacts..."
UserContact.create(first_name: "fanny", last_name: "ibanez", user_id: 1)
UserContact.create(first_name: "gabriel", last_name: "ibanez", user_id: 2)
puts "#{UserContact.count} user(s) created"



puts ">>>> Starting creating flats..."

flat_1 = Flat.create(name: "Lovely flat in Barcelone",
                     description: Faker::Lorem.paragraph,
                     address: "33 calle de la frateria, Barcelone",
                     price_per_night: rand(40..500),
                     user_id: 1)                   
flat_1.tag_list.add("romance", "city lover")
file = URI.open('https://res.cloudinary.com/dcwc5yx5t/image/upload/v1622105745/francesca-tosolini-yYUu4R4Wuwk-unsplash_crxrlj.jpg')
flat_1.photo.attach(io: file, filename: 'flat_barcelona.jpg', content_type: 'image/jpg')
flat_1.save

flat_2 = Flat.create(name: "Big house in the country",
                     description: Faker::Lorem.paragraph,
                     address: "6 route des Champs, La Motte Beuvron",
                     price_per_night: rand(40..500),
                     user_id: 1)
flat_2.tag_list.add("nature", "sharing")
file = URI.open('https://res.cloudinary.com/dcwc5yx5t/image/upload/v1622105746/greta-farnedi-Z6NBAuKSpYQ-unsplash_tirgvw.jpg')
flat_2.photo.attach(io: file, filename: 'house_country.jpg', content_type: 'image/jpg')
flat_2.save

flat_3 = Flat.create(name: "Flat in Paris with view",
                     description: Faker::Lorem.paragraph,
                     address: "2 rue du centre, Paris",
                     price_per_night: rand(40..500),
                     user_id: 1)
flat_3.tag_list.add("city lover", "view", "romance")
file = URI.open('https://res.cloudinary.com/dcwc5yx5t/image/upload/v1622105708/adam-winger-_kifxaMv2QY-unsplash_rlkr3l.jpg')
flat_3.photo.attach(io: file, filename: 'flat_paris.jpg', content_type: 'image/jpg')
flat_3.save

flat_4 = Flat.create(name: "House over the méditéranée",
                     description: Faker::Lorem.paragraph,
                     address: "1 impasse du Soleil, Cassi",
                     price_per_night: rand(40..500),
                     user_id: 2)
flat_4.tag_list.add("sun", "sea", "view")
file = URI.open('https://res.cloudinary.com/dcwc5yx5t/image/upload/v1622105733/john-fornander-tVzyDSV84w8-unsplash_jpvfzh.jpg')
flat_4.photo.attach(io: file, filename: 'house_sea.jpg', content_type: 'image/jpg')
flat_4.save

flat_5 = Flat.create(name: "Cabane dans un arbre",
                     description: Faker::Lorem.paragraph,
                     address: "17 route du Chateau, Tourouvre",
                     price_per_night: rand(40..500),
                     user_id: 1)
flat_5.tag_list.add("nature", "cheminée", "coconning")
file = URI.open('https://res.cloudinary.com/dcwc5yx5t/image/upload/v1622105730/josh-hild-0_N6VO_DAN4-unsplash_peat5t.jpg')
flat_5.photo.attach(io: file, filename: 'house_tree.jpg', content_type: 'image/jpg')
flat_5.save

puts "#{Flat.count} flats created!"



puts ">>>> Starting creating bookings..."

Booking.create(start_date: Date.new(2021,10,1), end_date: Date.new(2021,10,10), guest_count: 2, flat_id:5, user_id: 1)
Booking.create(start_date: Date.new(2021,07,12), end_date: Date.new(2021,07,20), guest_count: 9, flat_id:1, user_id: 2)
Booking.create(start_date: Date.new(2021,12,22), end_date: Date.new(2021,12,29), guest_count: 6, flat_id:4, user_id: 1)
Booking.create(start_date: Date.new(2021,12,22), end_date: Date.new(2021,12,29), guest_count: 2, flat_id:0, user_id: 2)

puts "#{Booking.count} booking created!"