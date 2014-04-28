json.array!(@village_activities) do |village_activity|
  json.extract! village_activity, :village
end
