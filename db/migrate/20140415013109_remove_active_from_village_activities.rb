class RemoveActiveFromVillageActivities < ActiveRecord::Migration
  def change
    remove_column :village_activities, :active, :boolean
  end
end
