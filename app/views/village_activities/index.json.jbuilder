json.array!(@village_activities) do |village_activity|
  json.extract! village_activity, :id, :name, :village_id, :activity_id, :start_date, :end_date, :active
  json.url village_activity_url(village_activity, format: :json)
end
