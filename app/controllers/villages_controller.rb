class VillagesController < ApplicationController
  before_action :set_village, only: [:show, :edit, :update, :destroy]
  authorize_resource

  # GET /villages
  # GET /villages.json
  def index
    @villages = Village.active.alphabetical.paginate(:page => params[:page]).per_page(10)
  end

  # GET /villages/1
  # GET /villages/1.json
  def show
    @active_activities = @village.activities.alphabetical.map { |a| a.name }
  end

  # GET /villages/new
  def new
    @village = Village.new
  end

  # GET /villages/1/edit
  def edit
  end

  # POST /villages
  # POST /villages.json
  def create
    @village = Village.new(village_params)
    if @village.save
      redirect_to village_path(@village), notice: "#{@village.name} was added to the system."
    else
      render action: 'new'
    end
  end


  # PATCH/PUT /villages/1
  # PATCH/PUT /villages/1.json
  def update
    if @village.update(village_params)
      redirect_to village_path(@village), notice: "#{@village.name} was revised in the system."
    else
      render action: 'edit'
    end
  end

  # DELETE /villages/1
  # DELETE /villages/1.json
  def destroy
    @village.destroy
    #return to overall curriculums list (index)
    redirect_to villages_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_village
      @village = Village.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def village_params
      params.require(:village).permit(:name, :state, :district, :taluka, :active, :user_id)
    end
end
