# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.create(username: "Bob", name: "Bob Jones", email: "BobbyUgotts@bob,com")
g = Genus.create(commonname: "sunfish" )
s = Species.create(commonname: "redear", genus_id: g.id)

u.species << s
u.genus << g


