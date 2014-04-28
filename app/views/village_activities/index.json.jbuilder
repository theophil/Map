json.array!(@village_activities) do |village_activity|
  json.extract! village_activity.village, :id, :name, :taluka, :district, :state, :latitude, :longitude 
  json.url village_activity_url(village_activity, format: :json)
end
