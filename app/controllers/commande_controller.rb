class CommandeController < ApplicationController
  def index
  end

  def choisir
    @session[:proteines_value] = params["commande"]["proteines"]
    @session[:glucides_value] = params["commande"]["glucides"]
    @session[:legumes_value] = params["commande"]["legumes"]

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
