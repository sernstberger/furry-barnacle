class Admin::AttractionsController < Admin::BaseController

  authorize_actions_for Attraction

  before_action :set_attraction, only: [:edit, :update, :destroy]

  def index
    @q = Attraction.ransack(params[:q])
    @attractions = @q.result.order('name ASC').page(params[:page])
  end

  def show
    if request.path != attraction_path(@attraction)
      redirect_to @attraction, status: :moved_permanently
    end
  end

  def new
    @attraction = Attraction.new
  end

  def edit
  end

  def create
    @attraction = Attraction.new(attraction_params)

    respond_to do |format|
      if @attraction.save
        redirect_to edit_admin_attraction_path(@attraction.id), notice: 'Attraction was successfully created.'
      else
        render :new
      end
    end
  end

  def update
    if @attraction.update(attraction_params)
      redirect_to edit_admin_attraction_path(@attraction.id), notice: 'Attraction was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @attraction.destroy
    redirect_to admin_attractions_path, notice: 'Attraction was successfully destroyed.'
  end

  private
    def set_attraction
      @attraction = Attraction.friendly.find(params[:id])
    end

    def attraction_params
      params.require(:attraction).permit(:name, :about, :slug, :destination_id, :excerpt, :website, destinations: [])
    end
end
