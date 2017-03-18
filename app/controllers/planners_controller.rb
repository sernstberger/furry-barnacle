class PlannersController < ApplicationController
  before_action :set_planner, only: [:show, :edit, :update, :destroy]
  before_action :destination_search, only: [:edit, :update]
  before_action :attraction_search, only: [:edit, :update]

  def index
    @planners = Planner.all
  end

  def show
    # @attractions = Attraction.where(planner_id: @planner.id)
  end

  def new
    @planner = Planner.new
  end

  def edit
  end

  def create
    @planner = Planner.new(planner_params)

    respond_to do |format|
      if @planner.save
        format.html { redirect_to @planner, notice: 'Planner was successfully created.' }
        format.json { render :show, status: :created, location: @planner }
      else
        format.html { render :new }
        format.json { render json: @planner.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @planner.update(planner_params)
      redirect_to edit_planner_path(@planner), notice: 'Planner was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @planner.destroy
    respond_to do |format|
      format.html { redirect_to planners_url, notice: 'Planner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def sort
    params[:stop].each_with_index do |id, index|
      # Stop.update_all({position: index+1}, {id: id})
      Stop.update_all("position = #{index+1}, id = #{id}")
    end
    render nothing: true
  end

  private
    def set_planner
      @planner = Planner.find(params[:id])
    end

    def destination_search
      @q = Destination.ransack(params[:q])
      @destinations = @q.result.page(params[:page])
    end

    def attraction_search
      @q = Attraction.ransack(params[:q])
      @attractions = @q.result.page(params[:page])
    end

    def planner_params
      params.require(:planner).permit(:name, :start_date, :end_date, :user_id, stops_attributes: [])
    end
end
