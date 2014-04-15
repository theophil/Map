class Village < ActiveRecord::Base
	#relationships
	has_many :village_activities
	has_many :activities, through: :village_activities

	#validations
	validates_presence_of :district, :taluka, :state
	validates :name, presence: true, uniqueness: { case_sensitive: false }


	#scopes
	scope :active, -> { where(active: true) }
  	scope :inactive, -> { where(active: false) }
  	scope :alphabetical, -> { order('name') }

	#instance methods
 	before_save :find_coordinates

 	private
  	def find_coordinates
  		return nil if (self.name.nil? || self.taluka.nil? || self.district.nil? || self.state.nil?)
  		coords = Geocoder.coordinates(self.name+", "+self.taluka+", "+self.district+", "+self.state)
  		#first index of coordinates
  		self.latitude = coords[0]
  		#second index of coordinates
  		self.longitude = coords[1]
      coords
  	end

end
