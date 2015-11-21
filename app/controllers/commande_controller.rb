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
    @session[:ingredients] = ingredients
    @plats = Plat.get_all_by_ingredients(ingredients)
  end

  def plats
    plats = Plat.get_all_by_ingredients(@session["ingredients"])
    all = []
    taken = []
    nb_meals = @session["nb_meals"]
    rng = Random.new
    while all.count < nb_meals
      id = rng.rand(plats.count)
      if ! taken.include?(id)
        all << {plat: plats[id], ingredients: plats[id].ingredients}
        taken << id
      end
      if taken.count >= plats.count
        taken = []
      end
    end
    render json: all
  end
end
