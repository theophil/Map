class CreateVillageActivities < ActiveRecord::Migration
  def change
    create_table :village_activities do |t|
      t.integer :village_id
      t.integer :activity_id
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
