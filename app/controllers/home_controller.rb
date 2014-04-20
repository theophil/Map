class HomeController < ApplicationController
  include MapMaker # so we can create_map_link

  def index
  	@villages = Village.active.alphabetical.to_a
  	@activities = Activity.alphabetical.active.to_a
    @village_activities = VillageActivity.all.to_a #has no active field
    @map = create_map_link(@village_activities)
  end

  def about
  end

  def contact
  end

  def privacy
  end
end
