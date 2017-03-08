class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    @photos = Photo.all
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to edit_admin_user_path(@user.id), notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to edit_admin_user_path(@user.id), notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy

    redirect_to admin_users_path, notice: 'User was successfully destroyed.'
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      # will need to change params
      params.require(:user).permit(:name, :about, :city, :state, :slug, :excerpt)
    end
end
