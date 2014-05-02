class AddUserIdToVillages < ActiveRecord::Migration
  def change
    add_column :villages, :user_id, :integer
  end
end
