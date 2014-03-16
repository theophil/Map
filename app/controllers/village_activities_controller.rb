class VillageActivitiesController < ApplicationController
  before_action :set_village_activity, only: [:show, :edit, :update, :destroy]

  # GET /village_activities
  # GET /village_activities.json
  def index
    @village_activities = VillageActivity.all
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

    respond_to do |format|
      if @village_activity.save
        format.html { redirect_to @village_activity, notice: 'Village activity was successfully created.' }
        format.json { render action: 'show', status: :created, location: @village_activity }
      else
        format.html { render action: 'new' }
        format.json { render json: @village_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /village_activities/1
  # PATCH/PUT /village_activities/1.json
  def update
    respond_to do |format|
      if @village_activity.update(village_activity_params)
        format.html { redirect_to @village_activity, notice: 'Village activity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @village_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /village_activities/1
  # DELETE /village_activities/1.json
  def destroy
    @village_activity.destroy
    respond_to do |format|
      format.html { redirect_to village_activities_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_village_activity
      @village_activity = VillageActivity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def village_activity_params
      params.require(:village_activity).permit(:name, :village_id, :activity_id, :start_date, :end_date, :active)
    end
end
