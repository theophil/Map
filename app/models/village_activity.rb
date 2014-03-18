class VillageActivity < ActiveRecord::Base
	#relationships
	belongs_to :village
	belongs_to :activity

	#validations
	validates :activity_id, presence: true, numericality: { greater_than: 0, only_integer: true }
  	validates :village_id, presence: true, numericality: { greater_than: 0, only_integer: true }

  	validates_date :start_date, :on_or_before => lambda { Date.today }, :on_or_after_message => "should have started in the past", :on => :create
  	validates_date :end_date, :on_or_after => :start_date
end
