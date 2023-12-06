class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[landing]

  def landing
    # timer
  end

  def dashboard
  end

  # private

  # def timer
  #   sleep(5)
  #   redirect_to dashboard_path if user_signed_in?
  # end
end
