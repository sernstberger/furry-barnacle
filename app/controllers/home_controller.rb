class HomeController < ApplicationController

  def index
    @attractions = Attraction.all
    @destinations = Destination.all
    @posts = Post.all
  end

end
