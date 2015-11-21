json.array!(@plats) do |plat|
  json.extract! plat, :id, :name, :ingredient_id
  json.url plat_url(plat, format: :json)
end
