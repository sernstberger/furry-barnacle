class Admin::BaseController < ApplicationController
  layout 'admin'

  # check to see if user is logged in
  before_action :authenticate_user!

end
