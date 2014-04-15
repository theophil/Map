class AddActiveToVillageActivities < ActiveRecord::Migration
  def change
    add_column :village_activities, :active, :boolean
  end
end
