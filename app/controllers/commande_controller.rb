class CommandeController < ApplicationController
  def index
  end

  def choisir
    @session[:proteines_value] = params["commande"]["proteines"]
    @session[:glucides_value] = params["commande"]["glucides"]
    @session[:legumes_value] = params["commande"]["legumes"]
    @session[:box_size] = params["commande"]["box-size"]
    if params["nbmeals"] == "yes"
      @session[:nb_meals] = 2
    else
      @session[:nb_meals] = 3
    end
    @ingredients = Ingredient.all.group_by(&:categorie)
  end

  def menu
    ingredients = []

    params['ingredients'].each do | ingredient, _ |
      ingredients << ingredient.to_i
    end

    @plats = Plat.get_all_by_ingredients(ingredients)
  end
end
