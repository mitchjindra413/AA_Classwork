# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ArtworkShare.destroy_all
Artwork.destroy_all
User.destroy_all

user1 = User.create!(username: "Nill The Grass")
user2 = User.create!(username: 'Bill Nye')
user3 = User.create!(username: 'Da Science Guy')
art1 = Artwork.create!(title: 'mona', image_url: 'asdf', artist_id: user1.id)
art2 = Artwork.create!(title: 'lisa', image_url: 'asdfe', artist_id: user1.id)
art3 = Artwork.create!(title: 'moma mia', image_url: 'asdfdg', artist_id: user2.id)
share1 = ArtworkShare.create!(artwork_id: art1.id, viewer_id: user2.id)
share2 = ArtworkShare.create!(artwork_id: art2.id, viewer_id: user3.id)
share3 = ArtworkShare.create!(artwork_id: art2.id, viewer_id: user1.id)
c1 = Comment.create!(body: 'Wow', artwork_id: art1.id, author_id: user1.id)
c2 = Comment.create!(body: 'Woooow', artwork_id: art2.id, author_id: user2.id)
c3 = Comment.create!(body: 'Wooooooooooow', artwork_id: art3.id, author_id: user3.id)