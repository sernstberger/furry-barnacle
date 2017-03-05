class Admin::DestinationsController < Admin::BaseController
  before_action :set_destination, only: [:edit, :update, :destroy]

  def index
    @destinations = Destination.all
  end

  def new
    @destination = Destination.new
  end

  def edit
  end

  def create
    @destination = Destination.new(destination_params)

    if @destination.save
      redirect_to @destination, notice: 'Destination was successfully created.'
    else
      render :new
    end
  end

  def update
    if @destination.update(destination_params)
      redirect_to @destination, notice: 'Destination was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @destination.destroy

    redirect_to destinations_url, notice: 'Destination was successfully destroyed.'
  end

  private
    def set_destination
      @destination = Destination.find(params[:id])
    end

    def destination_params
      params.require(:destination).permit(:name, :about, :city, :state, :slug, :excerpt)
    end
end
