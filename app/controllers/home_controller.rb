class HomeController < ApplicationController
  include MapMaker # so we can create_map_link

  def index
  	@villages = Village.active.alphabetical.paginate(:page => params[:page]).per_page(10)
  	@activities = Activity.alphabetical.active.paginate(:page => params[:page]).per_page(10)
    @village_activities = VillageActivity.all.paginate(:page => params[:page]).per_page(10)
    @map = create_map_link(@village_activities)
  end

  def about
  end

  def contact
  end

  def privacy
  end
end
