class DestinationsController < ApplicationController
  before_action :set_destination, only: [:show, :edit, :update, :destroy]

  def index
    @q = Destination.ransack(params[:q])
    # @destinations = Destination.order('name ASC')
    @destinations = @q.result.page(params[:page])
    # @q.result(distinct: true)
  end

  def show
    if request.path != destination_path(@destination)
      redirect_to @destination, status: :moved_permanently
    end

    @destinations_in_state = Destination.where(state: @destination.state).where.not(id: @destination.id).limit(6)

    @attractions = Attraction.where(destination_id: @destination.id).order('name ASC').limit(12)
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
      @destination = Destination.friendly.find(params[:id])
    end

    def destination_params
      params.require(:destination).permit(:name, :about, :city, :state, :slug, :excerpt)
    end
end
