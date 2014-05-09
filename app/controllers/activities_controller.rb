class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  authorize_resource
  before_action :check_login

  # GET /activities
  # GET /activities.json
  def index
    @activities = Activity.alphabetical.active.paginate(:page => params[:page]).per_page(10)
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
  end

  # GET /activities/new
  def new
    @activity = Activity.new
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to activity_path(@activity), notice: "#{@activity.name} was added to the system."
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    if @activity.update(activity_params)
      redirect_to activity_path(@activity), notice: "#{@activity.name} was revised in the system."
    else
      render action: 'edit'
    end
  end


  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity.destroy
    redirect_to activities_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:name, :user_id, :active)
    end
end
