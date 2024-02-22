# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"
require "faker"

urls = ["https://media.artsper.com/artwork/652392_1_l.jpg",
  "https://media.artsper.com/artwork/2144158_1_m.jpg",
  "https://media.artsper.com/artwork/2173875_1_m.jpg",
  "https://media.artsper.com/artwork/2139686_1_m.jpg",
  "https://media.artsper.com/artwork/2174006_1_m.jpg",
  "https://media.artsper.com/artwork/2162710_1_m.jpg",
  "https://media.artsper.com/artwork/2172395_1_m.jpg",
  "https://media.artsper.com/artwork/2174509_1_m.jpg",
  "https://media.artsper.com/artwork/2172266_1_m.jpg",
  "https://media.artsper.com/artwork/2173931_1_m.jpg"
]
# urls = {
#  "https://media.artsper.com/artwork/652392_1_l.jpg" => "4zg9prq7tznyrm1k4e8ykku5k0rf",
#  "https://media.artsper.com/artwork/2144158_1_m.jpg" => "nxp58853uyyvzskn2t8x9s5zi09m",
#  "https://media.artsper.com/artwork/2173875_1_m.jpg" => "dg7vo9tgpf48yv29kkryrccaokdc",
#  "https://media.artsper.com/artwork/2139686_1_m.jpg" => "gcsyoqo0jv6m2f2f1yqw56qj1gyw",
#  "https://media.artsper.com/artwork/2174006_1_m.jpg" => "lbwbyaflwxsxy8anql9jfn70phvk",
#  "https://media.artsper.com/artwork/2162710_1_m.jpg" => "ia3p94cp42qv81mp565q52gbi7yx",
#  "https://media.artsper.com/artwork/2172395_1_m.jpg" => "8tpcmcpbowt7jlz20g2an8nxdmv0",
#  "https://media.artsper.com/artwork/2174509_1_m.jpg" => "4uxlrgexs4o257tpzlmiey82nmm2",
#  "https://media.artsper.com/artwork/2172266_1_m.jpg" => "6490foyi1k2a8nywhisaslsdnwkt",
#  "https://media.artsper.com/artwork/2173931_1_m.jpg" => "8ia1ura1dbqwifk95yn5271541sd"
#}

list_of_users = []
list_of_masterpieces = []
list_of_categories = ["Paint", "Sculpture", "Photo"]
list_of_titles = [Faker::GreekPhilosophers.name,
  Faker::Games::Heroes.name,
  Faker::Music::RockBand.name,
  Faker::Music::Hiphop.groups,
  Faker::Music::Prince.album
]

puts "Cleaning databases..."
Booking.destroy_all
Masterpiece.destroy_all
User.destroy_all

puts "Creating users..."
  user_bq = User.create(email: "bq@email.com", password: "password", name: "Benoit")
  list_of_users << user_bq
  user_mv = User.create(email: "mv@email.com", password: "password", name: "Mathieu")
  list_of_users << user_mv
  user_gl = User.create(email: "gl@email.com", password: "password", name: "Guillaume")
  list_of_users << user_gl
  user_fl = User.create(email: "fl@email.com", password: "password", name: "François")
  list_of_users << user_fl

  20.times do
    user = User.create(email: Faker::Internet.email, password: "password", name: Faker::Name.name)
    list_of_users << user
  end
puts "  >> #{User.count} users created"

puts "Creating masterpieces..."
  # Oeuvre 1
  file = URI.open("https://media.artsper.com/artwork/652392_1_l.jpg")
  masterpiece1 = Masterpiece.new(title: "Balancing", description: "Cette œuvre comprend du graphite, de l'encre et de la gouache, et est une combinaison d'exécutions intuitives et planifiées.", price: "1587", address: "Royaume-Uni", category: "Paint", user_id: user_bq.id)
  masterpiece1.photo.attach(io: file, filename: "balancing.png", content_type: "image/png")
  masterpiece1.save!

  # Oeuvre 2
  file = URI.open("https://media.artsper.com/artwork/2144158_1_m.jpg")
  masterpiece2 = Masterpiece.new(title: "Flamenco", description: "Cette œuvre créée en terre fut moulée pour être réalisée en 8 tirages et 4 épreuves d'artiste.", price: "4500", address: "France", category: "Sculpture", user_id: user_mv.id)
  masterpiece2.photo.attach(io: file, filename: "flamenco.png", content_type: "image/png")
  masterpiece2.save!

  # Oeuvre 3
  file = URI.open("https://media.artsper.com/artwork/2173875_1_m.jpg")
  masterpiece3 = Masterpiece.new(title: "Mhysa", description: "À travers mes séries photographiques intitulées Wanderlust, j'explore le thème ethnique en incarnant mentalement des femmes du monde entier.", price: "1500", address: "France", category: "Photo", user_id: user_gl.id)
  masterpiece3.photo.attach(io: file, filename: "mhysa.png", content_type: "image/png")
  masterpiece3.save!

  # Oeuvre 4
  file = URI.open("https://media.artsper.com/artwork/2139686_1_m.jpg")
  masterpiece4 = Masterpiece.new(title: "Bubbles and bonbons", description: "Née en 1971 à San Francisco, la peintre Amy Nelder appelle son œuvre « Pop Trompe L'oeil ».", price: "6580", address: "Etats-Unis", category: "Paint", user_id: user_fl.id)
  masterpiece4.photo.attach(io: file, filename: "bubles.png", content_type: "image/png")
  masterpiece4.save!

  # Oeuvre 5
  file = URI.open("https://media.artsper.com/artwork/2174006_1_m.jpg")
  masterpiece5 = Masterpiece.new(title: "Marius", description: "Sculpture : acrylique, métal, résine", price: "1100", address: "France", category: "Sculpture", user_id: user_bq.id)
  masterpiece5.photo.attach(io: file, filename: "marius.png", content_type: "image/png")
  masterpiece5.save!

  # Oeuvre 6
  file = URI.open("https://media.artsper.com/artwork/2162710_1_m.jpg")
  masterpiece6 = Masterpiece.new(title: "Coluche", description: "Iconic Portraits", price: "1400", address: "Belgique", category: "Photo", user_id: user_mv.id)
  masterpiece6.photo.attach(io: file, filename: "coluche.png", content_type: "image/png")
  masterpiece6.save!

  # Oeuvre 7
  file = URI.open("https://media.artsper.com/artwork/2172395_1_m.jpg")
  masterpiece7 = Masterpiece.new(title: "Andalouse", description: "Sculpture réalisée entièrement à la main, en chêne teinté par oxydation et feuille d'or.", price: "1960", address: "France", category: "Sculpture", user_id: user_gl.id)
  masterpiece7.photo.attach(io: file, filename: "andalouse.png", content_type: "image/png")
  masterpiece7.save!

  # Oeuvre 8
  file = URI.open("https://media.artsper.com/artwork/2174509_1_m.jpg")
  masterpiece8 = Masterpiece.new(title: "Boy looking up", description: "Peinture : peinture aérosol, Pochoir", price: "3900", address: "Belgique", category: "Paint", user_id: user_fl.id)
  masterpiece8.photo.attach(io: file, filename: "boy.png", content_type: "image/png")
  masterpiece8.save!

  # Oeuvre 9
  file = URI.open("https://media.artsper.com/artwork/2172266_1_m.jpg")
  masterpiece9 = Masterpiece.new(title: "Orbe", description: "À travers ses photographies mais aussi ses éditions, l’artiste fabrique un univers onirique et illusoire.", price: "1800", address: "France", category: "Photo", user_id: user_bq.id)
  masterpiece9.photo.attach(io: file, filename: "orbe.png", content_type: "image/png")
  masterpiece9.save!

  # Oeuvre 10
  file = URI.open("https://media.artsper.com/artwork/2173931_1_m.jpg")
  masterpiece10 = Masterpiece.new(title: "Alfons bois", description: "Oeuvre unique, sculpture en bois, chaque tranche est découpée au laser et après assemblée à la main.", price: "1900", address: "Etats Unis", category: "Sculpture", user_id: user_mv.id)
  masterpiece10.photo.attach(io: file, filename: "alfons.png", content_type: "image/png")
  masterpiece10.save!

  30.times do
    file = URI.open(urls[rand(0..(urls.count-1))])
    title = "#{list_of_titles[rand(0..(list_of_titles.count-1))]}#{rand(0..1000).to_s}"
    masterpiece = Masterpiece.new(title: title, description: Faker::Movies::HarryPotter.quote, price: rand(1000..10000), address: Faker::Address.full_address, category: list_of_categories[rand(0..(list_of_categories.count-1))], user_id: list_of_users[rand(0..(User.count-1))].id)
    masterpiece.photo.attach(io: file, filename: "#{title}.png", content_type: "image/png")
    masterpiece.save!
    list_of_masterpieces << masterpiece
  end

puts "  >> #{Masterpiece.count} masterpieces created"

puts "Creating bookings..."
  # Booking 1
  booking1 = Booking.create(user_id: user_fl.id,masterpiece_id: masterpiece1.id, start_at: Date.today, end_at: Date.today+rand(5..30), total_amount: rand(1000..10000))
  booking1.save!

  # Booking 2
  booking2 = Booking.create(user_id: user_mv.id,masterpiece_id: masterpiece2.id, start_at: Date.today, end_at: Date.today+rand(5..30), total_amount: rand(1000..10000))
  booking2.save!

  # Booking 3
  booking3 = Booking.create(user_id: user_gl.id,masterpiece_id: masterpiece3.id, start_at: Date.today, end_at: Date.today+rand(5..30), total_amount: rand(1000..10000))
  booking3.save!

  # Booking 4
  booking4 = Booking.create(user_id: user_bq.id,masterpiece_id: masterpiece4.id, start_at: Date.today, end_at: Date.today+rand(5..30), total_amount: rand(1000..10000))
  booking4.save!

  # Booking 5
  booking5 = Booking.create(user_id: user_fl.id,masterpiece_id: masterpiece5.id, start_at: Date.today, end_at: Date.today+rand(5..30), total_amount: rand(1000..10000))
  booking5.save!

  # Booking 6
  booking6 = Booking.create(user_id: user_mv.id,masterpiece_id: masterpiece6.id, start_at: Date.today, end_at: Date.today+rand(5..30), total_amount: rand(1000..10000))
  booking6.save!

  # Booking 7
  booking7 = Booking.create(user_id: user_gl.id,masterpiece_id: masterpiece7.id, start_at: Date.today, end_at: Date.today+rand(5..30), total_amount: rand(1000..10000))
  booking7.save!

  # Booking 8
  booking8 = Booking.create(user_id: user_bq.id,masterpiece_id: masterpiece8.id, start_at: Date.today, end_at: Date.today+rand(5..30), total_amount: rand(1000..10000))
  booking8.save!

  10.times do
    booking = Booking.create(user_id: list_of_users[rand(0..(list_of_users.count-1))].id, masterpiece_id: list_of_masterpieces[rand(0..(list_of_masterpieces.count-1))].id, start_at: Date.today-rand(5..300), end_at: Date.today+rand(5..300), total_amount: rand(1000..10000))
    booking.save!
  end

puts "  >> #{Booking.count} bookings created"

puts "Finished!"
