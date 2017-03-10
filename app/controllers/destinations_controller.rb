class DestinationsController < ApplicationController
  before_action :set_destination, only: [:show, :edit, :update, :destroy]

  def index
    @q = Destination.ransack(params[:q])
    # @destinations = Destination.order('name ASC')
    @destinations = @q.result
    # @q.result(distinct: true)
  end

  def show
    if request.path != destination_path(@destination)
      redirect_to @destination, status: :moved_permanently
    end

    @attractions = Attraction.where(destination_id: @destination.id)
  end

  def new
    @destination = Destination.new
  end

  def edit
  end

  def create
    @destination = Destination.new(destination_params)

    respond_to do |format|
      if @destination.save
        format.html { redirect_to @destination, notice: 'Destination was successfully created.' }
        format.json { render :show, status: :created, location: @destination }
      else
        format.html { render :new }
        format.json { render json: @destination.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @destination.update(destination_params)
        format.html { redirect_to @destination, notice: 'Destination was successfully updated.' }
        format.json { render :show, status: :ok, location: @destination }
      else
        format.html { render :edit }
        format.json { render json: @destination.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @destination.destroy
    respond_to do |format|
      format.html { redirect_to destinations_url, notice: 'Destination was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_destination
      @destination = Destination.friendly.find(params[:id])
    end

    def destination_params
      params.require(:destination).permit(:name, :about, :city, :state, :slug, :excerpt)
    end
end
