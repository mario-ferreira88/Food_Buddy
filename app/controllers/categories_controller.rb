class CategoriesController < ApplicationController
  def index
    @categories = current_user.profile.categories
  end

  def show
    @category = Category.find(params[:id])
    @profiles = @category.profiles
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
