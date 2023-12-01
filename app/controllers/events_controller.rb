class EventsController < ApplicationController
  before_action :find_event, only: %i[show edit update destroy add_group]
  def index
    @events = Event.where(user: current_user)
  end

  def show
    @groups = Group.where(owner: current_user)
  end

  def new
    @event = Event.new
  end

  def edit
    @restaurant = @event.restaurant
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy!
    redirect_to my_profile_profiles_path, notice: 'Event was successfully cancelled!'
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      if params["group_field"]["selection"] == "Group"
        redirect_to new_group_path
      else
        redirect_to event_path(@event)
      end
    else
      render :new
    end
  end

  def add_group
    group = Group.find(params[:group_id])

    if @event.groups << group
      redirect_to @event, notice: 'Group added to the event successfully.'
    else
      redirect_to @event, alert: 'Failed to add group to the event.'
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :restaurant_id, :user_id, :group_id)
  end

  def find_event
    @event = Event.find(params[:id])
  end
end
