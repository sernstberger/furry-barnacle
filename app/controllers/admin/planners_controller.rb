class Admin::PlannersController < Admin::BaseController
  before_action :set_planner, only: [:show, :edit, :update, :destroy]

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
    respond_to do |format|
      if @planner.update(planner_params)
        format.html { redirect_to @planner, notice: 'Planner was successfully updated.' }
        format.json { render :show, status: :ok, location: @planner }
      else
        format.html { render :edit }
        format.json { render json: @planner.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @planner.destroy
    respond_to do |format|
      format.html { redirect_to planners_url, notice: 'Planner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_planner
      @planner = Planner.find(params[:id])
    end

    def planner_params
      params.require(:planner).permit(:name, :start_date, :end_date, :user_id)
    end
end
