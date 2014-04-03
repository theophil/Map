class Village < ActiveRecord::Base
	#relationships
	has_many :village_activities
	has_many :activities, through: :village_activities

	#validations
	validates_presence_of :name, :district, :taluka, :state
	validates_absence_of :longitude, on: :create
	validates_absence_of :latitude, on: :create

	#scopes
	scope :active, -> { where(active: true) }
  	scope :inactive, -> { where(active: false) }
  	#scope :alphabetical, -> { order('name') }

	#instance methods
 	before_save :find_coordinates

  	def find_coordinates
  		#first index of coordinates
  		self.latitude = Geocoder.coordinates(self.name+", "+self.taluka+", "+self.district+", "+self.state)[0]
  		sleep 1
  		#second index of coordinates
  		self.longitude = Geocoder.coordinates(self.name+", "+self.taluka+", "+self.district+", "+self.state)[1]
  		sleep 1
  	end
end
