class Village < ActiveRecord::Base
	# Relationships
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

  def create_map_link(zoom=12,width=800,height=800)
    markers = "";
    markers += "&markers=color:red%7Ccolor:red%7Clabel:#{i}%7C#{self.latitude},#{self.longitude}"
    map = "http://maps.google.com/maps/api/staticmap?center= #{latitude},#{longitude}&zoom=#{zoom}&size=#{width}x#{height}&maptype=roadmap#{markers}&sensor=false"
  end

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
