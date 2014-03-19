class VillageActivity < ActiveRecord::Base
	#relationships
	belongs_to :village
	belongs_to :activity

	#validations
	validates :activity_id, presence: true, numericality: { greater_than: 0, only_integer: true }
  	validates :village_id, presence: true, numericality: { greater_than: 0, only_integer: true }

  	validates_date :start_date, :on_or_before => lambda { Date.today }, :on_or_after_message => "should have started in the past", :on => :create
  	validates_date :end_date, :on_or_after => :start_date

  	validate :activity_is_not_already_assigned_to_village

  	def activity_is_not_already_assigned_to_village
    unless VillageActivity.where(activity_id: self.activity_id, village_id: self.village_id).to_a.empty?
      errors.add(:activity, "has already been assigned to this village")
    end
  end
end
