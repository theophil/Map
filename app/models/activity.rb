class Activity < ActiveRecord::Base
	# #relationships
	has_many :village_activities
	has_many :villages, through: :village_activities

	# #validations
	validates_presence_of :name
end
