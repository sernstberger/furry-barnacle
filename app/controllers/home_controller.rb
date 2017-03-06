class HomeController < ApplicationController

  def index
    @attractions = Attraction.all
    @destinations = Destination.order('name ASC').first(3)
    @posts = Post.all
  end

end
