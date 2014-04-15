class CreateVillages < ActiveRecord::Migration
  def change
    create_table :villages do |t|
      t.string :name
      t.decimal :longitude
      t.decimal :latitude
      t.string :state
      t.string :district
      t.string :taluka
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
