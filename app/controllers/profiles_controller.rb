class ProfilesController < ApplicationController
  # GET /profiles/:id
  def show
    @user = current_user
    @profile = @user.profile
  end
end
