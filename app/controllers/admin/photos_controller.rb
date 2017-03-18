class Admin::PhotosController < Admin::BaseController

  authorize_actions_for Photo

  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  def index
    @photos = Photo.all
  end

  def show
    @attractions = Attraction.where(photo_id: @photo.id)
  end

  def new
    @photo = Photo.new
  end

  def edit
  end

  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      redirect_to admin_photos_path, notice: 'Photo was successfully created.'
    else
      render :new
    end
  end

  def update
    if @photo.update(photo_params)
      redirect_to edit_admin_photo_path(@photo.id), notice: 'Photo was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @photo.destroy
    redirect_to admin_photos_path, notice: 'Photo was successfully destroyed.'
  end

  private
    def set_photo
      @photo = Photo.find(params[:id])
    end

    def photo_params
      params.require(:photo).permit(:image, :name, :description, destination_ids: [])
    end
end
