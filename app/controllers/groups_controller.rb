class GroupsController < ApplicationController
  before_action :find_group, only: %i[show edit update destroy]

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    @group.user = current_user

    if @group.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def show
    @events = @group.events
  end

  def update
    if @group.update(group_params)
      redirect_to group_path(@group)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_path
  end

  def edit
  end

  def index
    @groups = Group.all
  end

  private

  def group_params
    params.require(:group).permit(:name, :image, :event_id)
  end

  def find_group
    @group = Group.find(params[:id])
  end
end
