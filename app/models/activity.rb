class Activity < ActiveRecord::Base
	# Relationships
	has_many :village_activities
	has_many :villages, through: :village_activities
	belongs_to :user

	# Validations
	validates_presence_of :name
	validates :name, uniqueness: { case_sensitive: false }

	#scopes
	scope :active, -> { where(active: true) }
  	scope :inactive, -> { where(active: false) }
  	scope :alphabetical, -> { order('name') }

  	
end 
