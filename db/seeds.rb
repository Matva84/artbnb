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

puts "Cleaning databases..."
Masterpiece.destroy_all
User.destroy_all

puts "Creating users..."
user_bq = User.create(email: "bq@email.com", password: "password")
user_bq.save!
user_mv = User.create(email: "mv@email.com", password: "password")
user_mv.save!
user_gl = User.create(email: "gl@email.com", password: "password")
user_gl.save!
user_fl = User.create(email: "fl@email.com", password: "password")
user_fl.save!

puts "Creating masterpieces..."

# Oeuvre 1
file = URI.open("https://media.artsper.com/artwork/652392_1_l.jpg")
masterpiece = Masterpiece.new(title: "Balancing", description: "Cette œuvre comprend du graphite, de l'encre et de la gouache, et est une combinaison d'exécutions intuitives et planifiées.", price: "1587", address: "Royaume-Uni", category: "paint", user_id: user_bq.id)
masterpiece.photo.attach(io: file, filename: "balancing.png", content_type: "image/png")
masterpiece.save!

puts "Created test #{masterpiece.title}"

# Oeuvre 2
file = URI.open("https://media.artsper.com/artwork/2144158_1_m.jpg")
masterpiece = Masterpiece.new(title: "Flamenco", description: "Cette œuvre créée en terre fut moulée pour être réalisée en 8 tirages et 4 épreuves d'artiste.", price: "4500", address: "France", category: "sculture", user_id: user_mv.id)
masterpiece.photo.attach(io: file, filename: "flamenco.png", content_type: "image/png")
masterpiece.save!

# Oeuvre 3
file = URI.open("https://media.artsper.com/artwork/2173875_1_m.jpg")
masterpiece = Masterpiece.new(title: "Mhysa", description: "À travers mes séries photographiques intitulées Wanderlust, j'explore le thème ethnique en incarnant mentalement des femmes du monde entier.", price: "1500", address: "France", category: "photo", user_id: user_gl.id)
masterpiece.photo.attach(io: file, filename: "mhysa.png", content_type: "image/png")
masterpiece.save!

# Oeuvre 4
file = URI.open("https://media.artsper.com/artwork/2139686_1_m.jpg")
masterpiece = Masterpiece.new(title: "Bubbles and bonbons", description: "Née en 1971 à San Francisco, la peintre Amy Nelder appelle son œuvre « Pop Trompe L'oeil ».", price: "6580", address: "Etats-Unis", category: "paint", user_id: user_fl.id)
masterpiece.photo.attach(io: file, filename: "bubles.png", content_type: "image/png")
masterpiece.save!

# Oeuvre 5
file = URI.open("https://media.artsper.com/artwork/2174006_1_m.jpg")
masterpiece = Masterpiece.new(title: "Marius", description: "Sculpture : acrylique, métal, résine", price: "1100", address: "France", category: "sculture", user_id: user_bq.id)
masterpiece.photo.attach(io: file, filename: "marius.png", content_type: "image/png")
masterpiece.save!

# Oeuvre 6
file = URI.open("https://media.artsper.com/artwork/2162710_1_m.jpg")
masterpiece = Masterpiece.new(title: "Coluche", description: "Iconic Portraits", price: "1400", address: "Belgique", category: "photo", user_id: user_mv.id)
masterpiece.photo.attach(io: file, filename: "coluche.png", content_type: "image/png")
masterpiece.save!

# Oeuvre 7
file = URI.open("https://media.artsper.com/artwork/2172395_1_m.jpg")
masterpiece = Masterpiece.new(title: "Andalouse", description: "Sculpture réalisée entièrement à la main, en chêne teinté par oxydation et feuille d'or.", price: "1960", address: "France", category: "sculture", user_id: user_gl.id)
masterpiece.photo.attach(io: file, filename: "andalouse.png", content_type: "image/png")
masterpiece.save!

# Oeuvre 8
file = URI.open("https://media.artsper.com/artwork/2174509_1_m.jpg")
masterpiece = Masterpiece.new(title: "Boy looking up", description: "Peinture : peinture aérosol, Pochoir", price: "3900", address: "Belgique", category: "paint", user_id: user_fl.id)
masterpiece.photo.attach(io: file, filename: "boy.png", content_type: "image/png")
masterpiece.save!

# Oeuvre 9
file = URI.open("https://media.artsper.com/artwork/2172266_1_m.jpg")
masterpiece = Masterpiece.new(title: "Orbe", description: "À travers ses photographies mais aussi ses éditions, l’artiste fabrique un univers onirique et illusoire.", price: "1800", address: "France", category: "photo", user_id: user_bq.id)
masterpiece.photo.attach(io: file, filename: "orbe.png", content_type: "image/png")
masterpiece.save!

# Oeuvre 10
file = URI.open("https://media.artsper.com/artwork/2173931_1_m.jpg")
masterpiece = Masterpiece.new(title: "Alfons bois", description: "Oeuvre unique, sculpture en bois, chaque tranche est découpée au laser et après assemblée à la main.", price: "1900", address: "Etats Unis", category: "sculture", user_id: user_mv.id)
masterpiece.photo.attach(io: file, filename: "alfons.png", content_type: "image/png")
masterpiece.save!

puts "Finished!"
