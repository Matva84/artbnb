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

puts "Cleaning databases..."
Booking.destroy_all
Masterpiece.destroy_all
User.destroy_all

puts "Creating users..."
  file = URI.open("https://kitt.lewagon.com/placeholder/users/benoit-mint")
  user_bq = User.new(email: "bq@email.com", password: "password", name: "Benoit")
  user_bq.photo.attach(io: file, filename: "benoit.png", content_type: "image/png")
  user_bq.save!
  list_of_users << user_bq

  file = URI.open("https://kitt.lewagon.com/placeholder/users/matva84")
  user_mv = User.new(email: "mv@email.com", password: "password", name: "Mathieu")
  user_mv.photo.attach(io: file, filename: "mathieu.png", content_type: "image/png")
  user_mv.save!
  list_of_users << user_mv

  file = URI.open("https://kitt.lewagon.com/placeholder/users/guillaumelmt")
  user_gl = User.new(email: "gl@email.com", password: "password", name: "Guillaume")
  user_gl.photo.attach(io: file, filename: "guillaume.png", content_type: "image/png")
  user_gl.save!
  list_of_users << user_gl

  file = URI.open("https://kitt.lewagon.com/placeholder/users/franlorf1050")
  user_fl = User.new(email: "fl@email.com", password: "password", name: "François")
  user_fl.photo.attach(io: file, filename: "francois.png", content_type: "image/png")
  user_fl.save!
  list_of_users << user_fl

  10.times do
    user = User.create(email: Faker::Internet.email, password: "password", name: Faker::Name.name)
    list_of_users << user
  end
puts "  >> #{User.count} users created"

puts "Creating masterpieces..."
  # Oeuvre 1
  file = URI.open("https://media.artsper.com/artwork/652392_1_l.jpg")
  masterpiece1 = Masterpiece.new(title: "Balancing", description: "This artwork includes graphite, ink and gouache, and is a combination of intuitive and planned executions.", price: "1587", address: "Royaume-Uni", category: "Paint", user_id: user_bq.id)
  masterpiece1.photo.attach(io: file, filename: "balancing.png", content_type: "image/png")
  masterpiece1.save!
  list_of_masterpieces << masterpiece1

  # Oeuvre 2
  file = URI.open("https://media.artsper.com/artwork/2144158_1_m.jpg")
  masterpiece2 = Masterpiece.new(title: "Flamenco", description: "This artwork created in clay was molded to be produced in 8 prints and 4 artist's proofs.", price: "4500", address: "France", category: "Sculpture", user_id: user_mv.id)
  masterpiece2.photo.attach(io: file, filename: "flamenco.png", content_type: "image/png")
  masterpiece2.save!
  list_of_masterpieces << masterpiece2

  # Oeuvre 3
  file = URI.open("https://media.artsper.com/artwork/2173875_1_m.jpg")
  masterpiece3 = Masterpiece.new(title: "Mhysa", description: "Through my photographic series entitled Wanderlust, I explore the ethnic theme by mentally embodying women from around the world.", price: "1500", address: "France", category: "Photo", user_id: user_gl.id)
  masterpiece3.photo.attach(io: file, filename: "mhysa.png", content_type: "image/png")
  masterpiece3.save!
  list_of_masterpieces << masterpiece3

  # Oeuvre 4
  file = URI.open("https://media.artsper.com/artwork/2139686_1_m.jpg")
  masterpiece4 = Masterpiece.new(title: "Bubbles and bonbons", description: "Born in 1971 in San Francisco, the painter Amy Nelder calls her work “Pop Trompe L'oeil”.", price: "6580", address: "Etats-Unis", category: "Paint", user_id: user_fl.id)
  masterpiece4.photo.attach(io: file, filename: "bubles.png", content_type: "image/png")
  masterpiece4.save!
  list_of_masterpieces << masterpiece4

  # Oeuvre 5
  file = URI.open("https://media.artsper.com/artwork/2174006_1_m.jpg")
  masterpiece5 = Masterpiece.new(title: "Marius", description: "Sculpture: acrylic, metal, resin", price: "1100", address: "France", category: "Sculpture", user_id: user_bq.id)
  masterpiece5.photo.attach(io: file, filename: "marius.png", content_type: "image/png")
  masterpiece5.save!
  list_of_masterpieces << masterpiece5

  # Oeuvre 6
  file = URI.open("https://media.artsper.com/artwork/2162710_1_m.jpg")
  masterpiece6 = Masterpiece.new(title: "Coluche", description: "Iconic Portraits", price: "1400", address: "Belgique", category: "Photo", user_id: user_mv.id)
  masterpiece6.photo.attach(io: file, filename: "coluche.png", content_type: "image/png")
  masterpiece6.save!
  list_of_masterpieces << masterpiece6

  # Oeuvre 7
  file = URI.open("https://media.artsper.com/artwork/2172395_1_m.jpg")
  masterpiece7 = Masterpiece.new(title: "Andalouse", description: "Sculpture made entirely by hand, in oak tinted by oxidation and gold leaf.", price: "1960", address: "France", category: "Sculpture", user_id: user_gl.id)
  masterpiece7.photo.attach(io: file, filename: "andalouse.png", content_type: "image/png")
  masterpiece7.save!
  list_of_masterpieces << masterpiece7

  # Oeuvre 8
  file = URI.open("https://media.artsper.com/artwork/2174509_1_m.jpg")
  masterpiece8 = Masterpiece.new(title: "Boy looking up", description: "Painting: spray paint, stencil", price: "3900", address: "Belgique", category: "Paint", user_id: user_fl.id)
  masterpiece8.photo.attach(io: file, filename: "boy.png", content_type: "image/png")
  masterpiece8.save!
  list_of_masterpieces << masterpiece8

  # Oeuvre 9
  file = URI.open("https://media.artsper.com/artwork/2172266_1_m.jpg")
  masterpiece9 = Masterpiece.new(title: "Orbe", description: "Through his photographs but also his editions, the artist creates a dreamlike and illusory universe.", price: "1800", address: "France", category: "Photo", user_id: user_bq.id)
  masterpiece9.photo.attach(io: file, filename: "orbe.png", content_type: "image/png")
  masterpiece9.save!
  list_of_masterpieces << masterpiece9

  # Oeuvre 10
  file = URI.open("https://media.artsper.com/artwork/2173931_1_m.jpg")
  masterpiece10 = Masterpiece.new(title: "Alfons bois", description: "Unique work, wooden sculpture, each slice is laser cut and then assembled by hand.", price: "1900", address: "Etats Unis", category: "Sculpture", user_id: user_mv.id)
  masterpiece10.photo.attach(io: file, filename: "alfons.png", content_type: "image/png")
  masterpiece10.save!
  list_of_masterpieces << masterpiece10

  # Oeuvre 11
  file = URI.open("https://media.artsper.com/artwork/2142439_1_m.jpg")
  masterpiece11 = Masterpiece.new(title: "Bahamas Speed Week", description: "Bahamas Speed Week in Nassau in 1963.", price: "1900", address: "Etats Unis", category: "Photo", user_id: user_fl.id)
  masterpiece11.photo.attach(io: file, filename: "bahamas.png", content_type: "image/png")
  masterpiece11.save!
  list_of_masterpieces << masterpiece11

   # Oeuvre 12
   file = URI.open("https://media.artsper.com/artwork/2172795_1_m.jpg")
   masterpiece12 = Masterpiece.new(title: "Drift", description: "Behind the scenes of the nation, our solitary navigator reflects on the grandeur of a land that is both ethereal and familiar.", price: "2340", address: "France", category: "Photo", user_id: user_bq.id)
   masterpiece12.photo.attach(io: file, filename: "drift.png", content_type: "image/png")
   masterpiece12.save!
   list_of_masterpieces << masterpiece12

   # Oeuvre 13
   file = URI.open("https://media.artsper.com/artwork/2172240_1_m.jpg")
   masterpiece13 = Masterpiece.new(title: "Sci sull'acqua Venezia", description: "Water skiing scene on the canals of Venice in 1947.", price: "650", address: "Italie", category: "Photo", user_id: user_gl.id)
   masterpiece13.photo.attach(io: file, filename: "venezia.png", content_type: "image/png")
   masterpiece13.save!
    list_of_masterpieces << masterpiece13

  # Oeuvre 14
  file = URI.open("https://media.artsper.com/artwork/2177823_1_m.jpg")
  masterpiece14 = Masterpiece.new(title: "Lys", description: "Her paintings reflect her passion for humanity and she transcribes it through a multitude of expressive and aesthetic figures.", price: "1600", address: "France", category: "Paint", user_id: user_mv.id)
  masterpiece14.photo.attach(io: file, filename: "lys.png", content_type: "image/png")
  masterpiece14.save!
  list_of_masterpieces << masterpiece14

  # Oeuvre 15
  file = URI.open("https://media.artsper.com/artwork/2177250_1_m.jpg")
  masterpiece15 = Masterpiece.new(title: "Splash Paint Bucket", description: "Her paintings reflect her passion for humanity and she transcribes it through a multitude of expressive and aesthetic figures.", price: "1600", address: "France", category: "Paint", user_id: user_bq.id)
  masterpiece15.photo.attach(io: file, filename: "splash.png", content_type: "image/png")
  masterpiece15.save!
  list_of_masterpieces << masterpiece15

  # Oeuvre 16
  file = URI.open("https://media.artsper.com/artwork/2141342_1_m.jpg")
  masterpiece16 = Masterpiece.new(title: "Etat des choses", description: "Acrylic painting on texture made with a knife with coating and plaster. Coat of glossy anti-UV varnish for protection.", price: "450", address: "France", category: "Paint", user_id: user_fl.id)
  masterpiece16.photo.attach(io: file, filename: "chose.png", content_type: "image/png")
  masterpiece16.save!
  list_of_masterpieces << masterpiece16

  # Oeuvre 17
  file = URI.open("https://media.artsper.com/artwork/2141342_1_m.jpg")
  masterpiece17 = Masterpiece.new(title: "Signore e signori", description: "Work in perfect conservation, kept in its protective file, unframed. It is accompanied by a certificate of authenticity and provenance.", price: "450", address: "Italy", category: "Paint", user_id: user_gl.id)
  masterpiece17.photo.attach(io: file, filename: "signore.png", content_type: "image/png")
  masterpiece17.save!
  list_of_masterpieces << masterpiece17

  # Oeuvre 18
  file = URI.open("https://media.artsper.com/artwork/1378446_1_m.jpg")
  masterpiece18 = Masterpiece.new(title: "Lib-AIR-té", description: "It doesn't take much to dream: A vintage postage stamp, a symbol of travel. Who says travel says distant spaces, freedom, adventure, discoveries.", price: "1000", address: "France", category: "Paint", user_id: user_gl.id)
  masterpiece18.photo.attach(io: file, filename: "liberte.png", content_type: "image/png")
  masterpiece18.save!
  list_of_masterpieces << masterpiece18

  # Oeuvre 19
  file = URI.open("https://media.artsper.com/artwork/989430_1_m.jpg")
  masterpiece19 = Masterpiece.new(title: "Twin Palms Contemporary Oil Painting", description: "This is a painting from the Artist's West Coast series. She loves swimming, pools and the sun. This is the feeling that the artist wanted to convey to the viewer.", price: "4610", address: "United States", category: "Paint", user_id: user_bq.id)
  masterpiece19.photo.attach(io: file, filename: "twin.png", content_type: "image/png")
  masterpiece19.save!
  list_of_masterpieces << masterpiece19

  # Oeuvre 20
  file = URI.open("https://media.artsper.com/artwork/2112192_1_m.jpg")
  masterpiece20 = Masterpiece.new(title: "Tiger", description: "Tiger #7 is a limited edition photograph by Brad Wilson.", price: "2000", address: "United States", category: "Photo", user_id: user_mv.id)
  masterpiece20.photo.attach(io: file, filename: "tiger.png", content_type: "image/png")
  masterpiece20.save!
  list_of_masterpieces << masterpiece20

  # Oeuvre 21
  file = URI.open("https://media.artsper.com/artwork/1631121_1_m.jpg")
  masterpiece21 = Masterpiece.new(title: "Mario Basqauiat", description: "Tiger #7 is a limited edition photograph by Brad Wilson.", price: "1300", address: "France", category: "Sculpture", user_id: user_gl.id)
  masterpiece21.photo.attach(io: file, filename: "mario.png", content_type: "image/png")
  masterpiece21.save!
  list_of_masterpieces << masterpiece21

  # 10.times do
  #  file = URI.open(urls[rand(0..(urls.count-1))])
  #  masterpiece = Masterpiece.new(title: Faker::Fantasy::Tolkien.character, description: Faker::Movies::HarryPotter.quote, price: rand(1000..10000), address: Faker::Address.full_address, category: list_of_categories[rand(0..(list_of_categories.count-1))], user_id: list_of_users[rand(0..(User.count-1))].id)
  #  masterpiece.photo.attach(io: file, filename: "#{masterpiece.title}.png", content_type: "image/png")
  #  masterpiece.save!
  #  list_of_masterpieces << masterpiece
  #end

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

  booking_users = [user_bq, user_fl, user_gl, user_mv]
  10.times do
    start_at = Date.today + rand(-100..50)
    end_at = start_at + 10
    booking = Booking.create(user_id: booking_users[rand(0..(booking_users.count-1))].id, masterpiece_id: list_of_masterpieces[rand(0..(list_of_masterpieces.count-1))].id, start_at: start_at, end_at: end_at, total_amount: rand(1000..10000))
    booking.save!
  end

puts "  >> #{Booking.count} bookings created"

puts "Finished!"
