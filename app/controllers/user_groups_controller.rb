class UserGroupsController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    user = User.find(params[:user_id])

    if @group.users << user
      redirect_to @group, notice: 'User added to group successfully.'
    else
      redirect_to @group, alert: 'Failed to add user to group.'
    end
  end

  def destroy
    @group = Group.find(params[:group_id])
    user = User.find(params[:user_id])

    if @group.users.delete(user)
      redirect_to @group, notice: 'User removed from group successfully.'
    else
      redirect_to @group, alert: 'Failed to remove user from group.'
    end
  end

  private

  def user_group_params
    params.require(:user_group).permit(:group_id, :user_id)
  end
end
