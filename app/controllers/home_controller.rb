class HomeController < ApplicationController

  def index
    @attractions = Attraction.all
    @destinations = Destination.order('name ASC').first(3)
    @posts = Post.all
    @featured_post = Post.where(featured: true).first
  end

end
