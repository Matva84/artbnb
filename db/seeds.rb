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

# Oeuvre 5
Masterpiece.create(title: "Marius", description: "Sculpture : acrylique, métal, résine", price: "1100", address: "France", category: "sculture", user_id: user_bq.id)
# URL : https://media.artsper.com/artwork/2174006_1_m.jpg

# Oeuvre 6
Masterpiece.create(title: "Coluche", description: "Iconic Portraits", price: "1400", address: "Belgique", category: "photo", user_id: user_mv.id)
# URL : https://media.artsper.com/artwork/2162710_1_m.jpg

# Oeuvre 7
Masterpiece.create(title: "Andalouse", description: "Sculpture réalisée entièrement à la main, en chêne teinté par oxydation et feuille d'or.", price: "1960", address: "France", category: "sculture", user_id: user_gl.id)
# URL : https://media.artsper.com/artwork/2172395_1_m.jpg

# Oeuvre 8
Masterpiece.create(title: "Boy looking up", description: "Peinture : peinture aérosol, Pochoir", price: "3900", address: "Belgique", category: "paint", user_id: user_fl.id)
# URL : https://media.artsper.com/artwork/2174509_1_m.jpg

# Oeuvre 9
Masterpiece.create(title: "Orbe", description: "À travers ses photographies mais aussi ses éditions, l’artiste fabrique un univers onirique et illusoire.", price: "1800", address: "France", category: "photo", user_id: user_bq.id)
# URL : https://media.artsper.com/artwork/2172266_1_m.jpg

# Oeuvre 10
Masterpiece.create(title: "Alfons bois", description: "Oeuvre unique, sculpture en bois, chaque tranche est découpée au laser et après assemblée à la main.", price: "1900", address: "Etats Unis", category: "sculture", user_id: user_mv.id)
# URL : https://media.artsper.com/artwork/2173931_1_m.jpg

puts "Finished!"

# pour ajouter les photos dans la seed :
# dans le terminal :
# curl "url > nom de la photo"
# puis lancer, Cloudinary::Uploader.upload("nom de la photo")
# puis, rm "nom de la photo"
#
# dans ce fichier :
# ajouter dans chaque oeuvre, photo: "cl_image_tag("THE_IMAGE_ID_FROM_cloudinary")"
