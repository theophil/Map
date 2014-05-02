class AddUserIdToVillageActivities < ActiveRecord::Migration
  def change
    add_column :village_activities, :user_id, :integer
  end
end
