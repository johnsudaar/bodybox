class CommandeController < ApplicationController
  def index
  end

  def choisir
    @ingredients = Ingredient.all.group_by(&:categorie)
    puts @ingredients.to_json
  end
end
