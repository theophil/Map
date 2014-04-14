class Activity < ActiveRecord::Base
	# Relationships
	has_many :village_activities
	has_many :villages, through: :village_activities

	# Validations
	validates_presence_of :name
end
