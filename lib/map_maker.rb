module MapMaker
	def create_map_link(village_activities,zoom=6,width=800,height=800)
		latitude = 20.8365072
		longitude = 78.7093556
		markers = create_markers(village_activities)
		#juvadi- latitude 20.8365072 longtitude 78.7093556
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