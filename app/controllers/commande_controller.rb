class CommandeController < ApplicationController
  def index
  end

  def choisir
    @ingredients = Ingredient.all.group_by(&:categorie)
  end

  def menu 
    ingredients = []
    
    params['ingredients'].each do | ingredient, _ |
      ingredients << ingredient.to_i
    end

    puts(ingredients)
    @plats = Plat.get_all_by_ingredients(ingredients)

    puts("=========================================================================")
    puts(@plats)
  end
end
