class GroupsController < ApplicationController
  before_action :find_group, only: %i[show edit update destroy]

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner = current_user

    if @group.save
      UserGroup.create(user: current_user, group: @group)
      redirect_to group_path(@group)
    else
      render :new, status: :unprocessable_entity
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
    @groups = Group.where(owner: current_user)
  end

  private

  def group_params
    params.require(:group).permit(:name, :photo, :user_id)
  end

  def find_group
    @group = Group.find(params[:id])
  end
end
