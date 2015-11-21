json.array!(@ingredients) do |ingredient|
  json.extract! ingredient, :id, :nom, :categorie
  json.url ingredient_url(ingredient, format: :json)
end
