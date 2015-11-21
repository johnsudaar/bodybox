class CommandeController < ApplicationController
  def index
  end

  def choisir
    @ingredients = Ingredient.all.group_by(&:categorie)
  end
end
