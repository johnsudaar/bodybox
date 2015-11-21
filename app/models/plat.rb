class Plat < ActiveRecord::Base
  has_and_belongs_to_many :ingredients

  def self.get_all_by_ingredients(ingredients)
    selected = []

    Plat.all.each do | plat |
      add = true
      plat.ingredients.each do | i |
        if ! ingredients.include? i.id
          add = false
        end
      end
      if add
        selected << plat
      end
    end
    return selected
  end
end
