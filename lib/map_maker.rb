module MapMaker
	def create_map_link(village_activities,zoom=9,width=800,height=800)
		#juvadi
		# latitude = 20.8365072
		# longitude = 78.7093556
		#wardha, maharashtra, india
		latitude = 20.745319
		longitude = 78.60219459999999
		markers = create_markers(village_activities)
		#specify a specific longitude and latitude that's reasonably the center these villages
    	map = "http://maps.google.com/maps/api/staticmap?center= #{latitude},#{longitude}&zoom=#{zoom}&size=#{width}x#{height}&maptype=roadmap#{markers}&sensor=false"
  	end

	def create_markers(village_activities)
		markers = ""; marker_number = 1
  		village_activities.to_a.each do |va|
	    	markers += "&markers=color:red%7Ccolor:red%7Clabel:#{marker_number}%7C#{va.village.latitude},#{va.village.longitude}"
	    	marker_number += 1
  		end
  		markers
	end

end