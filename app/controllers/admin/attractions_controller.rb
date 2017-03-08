class Admin::AttractionsController < Admin::BaseController

  before_action :set_attraction, only: [:edit, :update, :destroy]

  def index
    @attractions = Attraction.all
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
        format.html { redirect_to @attraction, notice: 'Attraction was successfully created.' }
        format.json { render :show, status: :created, location: @attraction }
      else
        format.html { render :new }
        format.json { render json: @attraction.errors, status: :unprocessable_entity }
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
    respond_to do |format|
      format.html { redirect_to attractions_url, notice: 'Attraction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_attraction
      @attraction = Attraction.friendly.find(params[:id])
    end

    def attraction_params
      params.require(:attraction).permit(:name, :about, :slug, :destination_id, :excerpt, :website, destinations: [])
    end
end
