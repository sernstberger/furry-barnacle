class Admin::DestinationsController < Admin::BaseController
  before_action :set_destination, only: [:edit, :update, :destroy]

  def index
    @destinations = Destination.all
  end

  def new
    @destination = Destination.new
  end

  def edit
    @photos = Photo.all
  end

  def create
    @destination = Destination.new(destination_params)

    if @destination.save
      redirect_to edit_admin_destination_path(@destination.id), notice: 'Destination was successfully created.'
    else
      render :new
    end
  end

  def update
    if @destination.update(destination_params)
      redirect_to edit_admin_destination_path(@destination.id), notice: 'Destination was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @destination.destroy

    redirect_to admin_destinations_path, notice: 'Destination was successfully destroyed.'
  end

  private
    def set_destination
      @destination = Destination.friendly.find(params[:id])
    end

    def destination_params
      params.require(:destination).permit(:name, :about, :city, :state, :slug, :excerpt, photo_ids: [])
    end
end
