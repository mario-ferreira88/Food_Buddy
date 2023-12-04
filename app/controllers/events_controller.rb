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
    redirect_to @event and return if @event.progress == 100

    return unless @event.progress == 80

    @markers = @event.restaurants.geocoded.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { restaurant: })
      }
    end
  end

  def update
    @event.update(event_params)
    redirect_to edit_event_path(@event)
  end

  def destroy
    Event.find(params[:id]).destroy!
    redirect_to my_profile_profiles_path, notice: 'Event was successfully cancelled!'
  end

  def create
    redirect_to edit_event_path(current_user.events.create!)
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
    params.require(:event).permit(:name, :type, :date, :restaurant_id, :user_id, :group_id)
  end

  def find_event
    @event = Event.find(params[:id])
  end
end
