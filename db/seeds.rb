# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.create(username: "Bob", name: "Bob Jones", email: "BobbyUgotts@bob,com")
j = User.create(username: "Joe", name: "Joe Jones", email: "JoeyUgotts@bob,com")

s = Genus.create(common_name: "Sunfishes", order: "Perciformes", scientific_name: "Lepomis")
b = Genus.create(common_name: "Bass", scientific_name: "Micropterus", order: "Perciformes" )

bluegill = Species.create(common_name: "Bluegill", scientific_name: "Lepomis Macrochirus", species_name: "Macrochirus", genus_id: s.id)

pumpkinseed = Species.create(common_name: "Pumpkinseed", scientific_name: "Lepomis Gibbosus", species_name: "Gibbosus", genus_id: s.id)
redbreast = Species.create(common_name: "Redbreast Sunfish", scientific_name: "Lepomis Auritus", species_name: "Aritus", genus_id: s.id)
green = Species.create(common_name: "Green Sunfish", scientific_name: "Lepomis Cyanellus", species_name: "Cyanellus", genus_id: s.id)
warmouth = Species.create(common_name: "Warmouth", scientific_name: "Lepomis Gulosus", species_name: "Gulosus", genus_id: s.id)

large = Species.create(common_name: "Largemouth Bass", scientific_name: "Micropterus Salmoides", species_name: "Salmoides", genus_id: b.id)
small = Species.create(common_name: "Smallmouth Bass", scientific_name: "Micropterus Dolomieu", species_name: "Dolomieu", genus_id: b.id)
# s = Species.create(common_name: "redear", genus_id: g.id)

# sunfish = [bluegill, pumpkinseed, redbreast, green, warmouth]
# sunfish.each do |f| 
#     s.push(f)
# end

# basses = [large, small]
# basses.each do |f|
#     b.push(f)
# end

u.genus.push(s)
u.genus.push(b)
j.genus.push(b)

u.species.push(large)
j.species.push(pumpkinseed)
u.species.push(bluegill)
u.species.push(warmouth)
j.species.push(large)
j.species.push(small)


