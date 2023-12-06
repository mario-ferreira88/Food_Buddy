class ChatroomsController < ApplicationController
  before_action :authorize_user, only: %i[show]
  def index
    @chatrooms = current_user.groups.map(&:chatroom)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      render "pages/dashboard"
    end
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end

  def authorize_user
    group = Chatroom.find(params[:id]).group
    redirect_to dashboard_path unless group.users.include?(current_user)
  end
end
