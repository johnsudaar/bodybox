# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Ingredient.create({id: 1, nom:"Poulet/Dinde", categorie: "proteines"})
Ingredient.create({id: 2, nom:"Saumon", categorie: "proteines"})
Ingredient.create({id: 3, nom:"Thon", categorie: "proteines"})
Ingredient.create({id: 4, nom:"Rôti de porc", categorie: "proteines"})
Ingredient.create({id: 5, nom:"Boeuf", categorie: "proteines"})
Ingredient.create({id: 6, nom:"Haricot rouge", categorie: "proteines"})
Ingredient.create({id: 7, nom:"Oeuf", categorie: "proteines"})

Ingredient.create({id: 8, nom:"Riz complet", categorie: "glucides"})
Ingredient.create({id: 9, nom:"Quinoa", categorie: "glucides"})
Ingredient.create({id: 10, nom:"Pâtes complètes", categorie: "glucides"})
Ingredient.create({id: 11, nom:"Patate douce", categorie: "glucides"})

Ingredient.create({id: 12, nom:"Carotte", categorie: "legumes"})
Ingredient.create({id: 13, nom:"Courgette", categorie: "legumes"})
Ingredient.create({id: 14, nom:"Haricot", categorie: "legumes"})
Ingredient.create({id: 15, nom:"Tomate", categorie: "legumes"})
Ingredient.create({id: 16, nom:"Petits pois", categorie: "legumes"})
Ingredient.create({id: 17, nom:"Pois chiche", categorie: "legumes"})
Ingredient.create({id: 18, nom:"Poivron", categorie: "legumes"})
Ingredient.create({id: 19, nom:"Choux de bruxelles", categorie: "legumes"})
Ingredient.create({id: 20, nom:"Potimarron", categorie: "legumes"})
Ingredient.create({id: 21, nom:"Navet", categorie: "legumes"})
Ingredient.create({id: 22, nom:"Epinard", categorie: "legumes"})
Ingredient.create({id: 23, nom:"Radis", categorie: "legumes"})
Ingredient.create({id: 24, nom:"Oignon", categorie: "legumes"})
Ingredient.create({id: 25, nom:"Citron", categorie: "legumes"})
Ingredient.create({id: 26, nom:"Ananas", categorie: "legumes"})
Ingredient.create({id: 27, nom:"Raisin sec", categorie: "legumes"})
Ingredient.create({id: 28, nom:"Pomme", categorie: "legumes"})
Ingredient.create({id: 33, nom:"Poireau", categorie: "legumes"})
Ingredient.create({id: 34, nom:"Basilic", categorie: "legumes"})

Ingredient.create({id: 29, nom:"Baies de Goji", categorie: "superflux"})
Ingredient.create({id: 30, nom:"Aloe Vera", categorie: "superflux"})
Ingredient.create({id: 31, nom:"Racine Gingembre", categorie: "superflux"})
Ingredient.create({id: 32, nom:"Reishi Mushroom", categorie: "superflux"})

p1 = Plat.new({id: 1, nom: "Emincé de légumes et escalope de dinde grillée"})

p1.ingredients << Ingredient.find(1)
p1.ingredients << Ingredient.find(12)
p1.ingredients << Ingredient.find(13)
p1.ingredients << Ingredient.find(18)
p1.ingredients << Ingredient.find(24)
p1.ingredients << Ingredient.find(11)
p1.save!

p2 = Plat.new({id: 2, nom: "Riz cantonais"})
p2.ingredients << Ingredient.find(1)
p2.ingredients << Ingredient.find(16)
p2.ingredients << Ingredient.find(24)
p2.ingredients << Ingredient.find(7)
p2.ingredients << Ingredient.find(12)
p2.save!

p3 = Plat.new({id: 3, nom: "Fondue de légumes avec pavé de thon grillé"})
p3.ingredients << Ingredient.find(33)
p3.ingredients << Ingredient.find(20)
p3.ingredients << Ingredient.find(3)
p3.save!

p4 = Plat.new({id: 4, nom: "Compote de quinoa avec saumon au citron"})
p4.ingredients << Ingredient.find(2)
p4.ingredients << Ingredient.find(25)
p4.ingredients << Ingredient.find(9)
p4.ingredients << Ingredient.find(27)
p4.ingredients << Ingredient.find(28)
p4.save!

p5 = Plat.new({id: 5, nom: "Saumon poché au basilic, ses légumes et riz complet"})
p5.ingredients << Ingredient.find(34)
p5.ingredients << Ingredient.find(2)
p5.ingredients << Ingredient.find(12)
p5.ingredients << Ingredient.find(13)
p5.ingredients << Ingredient.find(24)
p5.ingredients << Ingredient.find(8)
p5.save!

p6 = Plat.new({id: 6, nom: "Poulet au citron et riz complet"})
p6.ingredients << Ingredient.find(1)
p6.ingredients << Ingredient.find(8)
p6.ingredients << Ingredient.find(25)
p6.ingredients << Ingredient.find(13)
p6.save!

p7 = Plat.new({id: 7, nom: "Poulet à l'ananas, poivron et riz complet"})
p7.ingredients << Ingredient.find(1)
p7.ingredients << Ingredient.find(18)
p7.ingredients << Ingredient.find(26)
p7.ingredients << Ingredient.find(8)
p7.save!