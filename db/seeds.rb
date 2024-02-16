# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Cleaning databases..."
Masterpiece.destroy_all
User.destroy_all

puts "Creating users..."
user_bq = User.create(email: "bq@email.com", password: "password")
user_mv = User.create(email: "mv@email.com", password: "password")
user_gl = User.create(email: "gl@email.com", password: "password")
user_fl = User.create(email: "fl@email.com", password: "password")

puts "Creating masterpieces..."

# Oeuvre 1
masterpiece = Masterpiece.create(title: "Balancing", description: "Cette œuvre comprend du graphite, de l'encre et de la gouache, et est une combinaison d'exécutions intuitives et planifiées.", price: "1587", address: "Royaume-Uni", category: "paint", user_id: user_bq.id)
# URL photo : https://media.artsper.com/artwork/652392_1_l.jpg

puts "Created test #{masterpiece.title}"

# Oeuvre 2
Masterpiece.create(title: "Flamenco", description: "Cette œuvre créée en terre fut moulée pour être réalisée en 8 tirages et 4 épreuves d'artiste.", price: "4500", address: "France", category: "sculture", user_id: user_mv.id)
# URL : https://media.artsper.com/artwork/2144158_1_m.jpg

# Oeuvre 3
Masterpiece.create(title: "Mhysa", description: "À travers mes séries photographiques intitulées Wanderlust, j'explore le thème ethnique en incarnant mentalement des femmes du monde entier.", price: "1500", address: "France", category: "photo", user_id: user_gl.id)
# URL : https://media.artsper.com/artwork/2173875_1_m.jpg

# Oeuvre 4
Masterpiece.create(title: "Bubbles and bonbons", description: "Née en 1971 à San Francisco, la peintre Amy Nelder appelle son œuvre « Pop Trompe L'oeil ».", price: "6580", address: "Etats-Unis", category: "paint", user_id: user_fl.id)
# URL : https://media.artsper.com/artwork/2139686_1_m.jpg
