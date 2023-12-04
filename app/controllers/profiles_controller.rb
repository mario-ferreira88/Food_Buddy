class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[show edit update destroy my_profile]

  # GET /profiles/:id
  def show
    @user = current_user
    @profile = @user.profile
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
      redirect_to my_profile_profiles_path
    else
      render :new
    end
  end

  def new
    @profile = Profile.new
  end

  def edit
    @categories = Category.all
  end

  def update
    if @profile.update(profile_params)
      redirect_to my_profile_profiles_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def my_profile
  end

  def destroy
    @profile.destroy
    redirect_to root_path
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :phone_number, :address, :photo, category_ids: [])
  end

  def set_profile
    @profile = current_user.profile
  end
end
