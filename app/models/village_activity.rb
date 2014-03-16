class VillageActivity < ActiveRecord::Base
	#relationships
	validates_presence_of :name
	validates :activity_id, presence: true, numericality: { greater_than: 0, only_integer: true }
  	validates :village_id, presence: true, numericality: { greater_than: 0, only_integer: true }

  	validates_date :start_date, :on_or_after => lambda { Date.today }, :on_or_after_message => "cannot be in the past", :on => :create
  	validates_date :end_date, :on_or_after => :start_date
end
