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

  def fin
    @plats = []
    @total = 0.0
    @session["plats"].each do | p |
      cur = {plat: Plat.find(p)}
      puts "Calcul de : #{cur[:plat].nom}"
      box_size = @session["box_size"]
      prix_elems = {"legumes" => 0.0, "glucides" => 0.0, "proteines" => 0.0}
      nb_elems = {"legumes" => 0, "glucides" => 0, "proteines" => 0}
      prix = {}
      cur[:plat].ingredients.each do |ingr|
        puts "Prix de #{ingr.nom} (#{ingr.categorie}) : #{ingr.prix}"
        prix_elems[ingr.categorie] += ingr.prix
        nb_elems[ingr.categorie] += 1
      end
      p_glucides = prix_elems["glucides"] / nb_elems["glucides"]
      p_proteines = prix_elems["proteines"] / nb_elems["proteines"]
      p_legumes = prix_elems["legumes"] / nb_elems["legumes"]

      prix_glucides = p_glucides * @session["glucides_value"].to_i
      prix_proteines = p_proteines * @session["proteines_value"].to_i
      prix_legumes = p_legumes * @session["legumes_value"].to_i
      puts "Moyenne glucides = #{p_glucides}"
      puts "Moyenne proteines = #{p_proteines}"
      puts "Moyenne legumes = #{p_glucides}"
      puts "Size glucides = #{@session["glucides_value"]}"
      puts "Size proteines = #{@session["proteines_value"]}"
      puts "Size legumes = #{@session["legumes_value"]}"
      puts "Prix glucides = #{prix_glucides}"
      puts "Prix proteines = #{prix_proteines}"
      puts "Prix legumes = #{prix_legumes}"
      prix_glob = prix_glucides + prix_proteines + prix_legumes
      puts "Prix sans marge : #{prix_glob}"
      if box_size == 500
        prix_glob += 9
      elsif box_size == 400
        prix_glob += 8.5
      else
        prix_glob += 7.5
      end

      prix_glob = prix_glob.round(2)
      puts "Prix avec marge : #{prix_glob}"

      cur[:prix] = prix_glob
      @total += prix_glob
      @plats << cur
    end
  end

  def plats
    plats = Plat.get_all_by_ingredients(@session["ingredients"])
    all = []
    user_plats = []
    taken = []
    nb_meals = @session["nb_meals"]
    rng = Random.new
    while all.count < nb_meals
      id = rng.rand(plats.count)
      if ! taken.include?(id)
        all << {plat: plats[id], ingredients: plats[id].ingredients}
        user_plats << plats[id].id
        taken << id
      end
      if taken.count >= plats.count
        taken = []
      end
    end
    @session["plats"] = user_plats
    render json: all
  end
end
