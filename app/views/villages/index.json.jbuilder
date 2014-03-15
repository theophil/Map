json.array!(@villages) do |village|
  json.extract! village, :id, :name, :longitude, :latitude, :state, :district, :taluka
  json.url village_url(village, format: :json)
end
