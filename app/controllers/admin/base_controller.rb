class Admin::BaseController < ApplicationController
  layout 'admin'

  # check to see if user is logged in
  before_action :authenticate_user!

  # allow admins to do things in the admin
  # authorize_actions_for Destination

end
