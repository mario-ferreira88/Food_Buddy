class ProfilesController < ApplicationController
  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    @profile.save
    redirect_to profiles_my_profile_path
  end

  def new
    @profile = Profile.new
  end

  # def edit
  #   @profile = current_user.profile
  # end

  # def update
  #   @profile = current_user.profile
  #   @profile.update(profile_params)
  #   redirect_to my_profile_path
  # end

  def my_profile
    @profile = current_user.profile
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :phone_number, :address, :photo)
  end
end
