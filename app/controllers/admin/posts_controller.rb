class Admin::PostsController < Admin::BaseController
  authorize_actions_for Post

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result.page(params[:page])
  end

  def show
    if request.path != post_path(@post)
      redirect_to @post, status: :moved_permanently
    end
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to edit_admin_post_path(@post.id), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to edit_admin_post_path(@post.id), notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body, :status, :featured, :slug, :excerpt, :publish_date)
    end
end
