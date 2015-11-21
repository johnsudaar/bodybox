# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

pates  = Ingredient.new({id: 1, nom:"Pates", categorie: "glucides"})
poids  = Ingredient.new({id: 2, nom:"Petits Poids", categorie: "legumes"})
viande = Ingredient.new({id: 3, nom:"Viande", categorie: "proteines"})
baies  = Ingredient.new({id: 4, nom:"Baies", categorie: "superflux"})

p1 = Plat.new({id: 1, nom: "Plat 1"})

p1.ingredients << pates
p1.ingredients << poids

p1.save!

p2 = Plat.new({id: 2, nom: "Plat 2"})

p2.ingredients << viande
p2.ingredients << pates

p2.save!
