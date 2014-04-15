class VillageActivitiesController < ApplicationController
  before_action :set_village_activity, only: [:show, :edit, :update, :destroy]

  # GET /village_activities
  # GET /village_activities.json
  def index
    @village_activities = VillageActivity.paginate(:page => params[:page]).per_page(10)
  end

  # GET /village_activities/1
  # GET /village_activities/1.json
  def show
  end

  # GET /village_activities/new
  def new
    @village_activity = VillageActivity.new
  end

  # GET /village_activities/1/edit
  def edit
  end

  # POST /village_activities
  # POST /village_activities.json
  def create
    @village_activity = VillageActivity.new(village_activity_params)
    if @village_activity.save
      redirect_to village_activity_path(@village_activity), notice: "#{@village_activity.name} was added to the system."
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /village_activities/1
  # PATCH/PUT /village_activities/1.json
  def update
    if @village_activity.update(village_activity_params)
      redirect_to village_activity_path(@village_activity), notice: "#{@village_activity.name} was revised in the system."
    else
      render action: 'edit'
    end
  end

  # DELETE /village_activities/1
  # DELETE /village_activities/1.json
  def destroy
    @village_activity.destroy
    #return to overall curriculums list (index)
    redirect_to village_activities_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_village_activity
      @village_activity = VillageActivity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def village_activity_params
      params.require(:village_activity).permit(:name, :village_id, :activity_id, :start_date, :end_date)
    end
end
