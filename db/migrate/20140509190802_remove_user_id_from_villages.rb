class RemoveUserIdFromVillages < ActiveRecord::Migration
  def change
    remove_column :villages, :user_id, :integer
  end
end
