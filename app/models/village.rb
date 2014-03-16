class Village < ActiveRecord::Base
	#relationships
	has_many :village_activities
	has_many :activities, through: :village_activities

	#validations
	validates_presence_of :name, :district, :taluka, :state
	validates_absence_of :longitude, on: :create #alterate syntax? :on => :create
	validates_absence_of :latitude, on: :create #alterate syntax? :on => :create
	#are the below neccessary if the above specifies on create?
	validates_numericality_of :longitude, only_decimal: true, allow_blank: false, on: :save #alterate syntax? :on => :save
	validates_numericality_of :latitude, only_decimal: true, allow_blank: false, on: :save #alterate syntax? :on => :save

	# instance methods
  	before_save :find_coordinates

  	def find_coordinates
  	end
end
