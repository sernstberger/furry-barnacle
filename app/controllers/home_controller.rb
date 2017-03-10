class HomeController < ApplicationController

  def index
    @attractions = Attraction.all
    @popular_destinations = Destination.order('name ASC').first(3)
    @posts = Post.all
    @featured_post = Post.where(featured: true).first

    @q = Destination.ransack(params[:q])
    @destinations = @q.result
  end

end
