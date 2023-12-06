class EventsController < ApplicationController
  before_action :find_event, only: %i[show edit update destroy add_group]

  def index
    @SoloEvents = Event.where(user: current_user, group_id: nil)
    @GroupEvents = Event.where(group: current_user.groups)
  end

  def show
    @groups = Group.where(owner: current_user)

    restaurant_categories = @event.restaurant.categories
    user_categories = @event.group.users.map(&:categories).flatten.uniq

    @matching_categories = []
    user_categories.each do |category|
      @matching_categories << category if category.in?(restaurant_categories)
    end
  end

  def edit
    @progress = params[:progress].try(:to_i) || @event.progress
    redirect_to @event and return if @progress == 100

    if @progress == 80
      @markers = @event.restaurants.geocoded.map do |restaurant|
        {
          lat: restaurant.latitude,
          lng: restaurant.longitude,
          info_window_html: render_to_string(partial: "info_window", locals: { restaurant: })
        }
      end
    end

    if @progress == 50
      @groups = Group.where(owner: current_user)
    end

    @group = @event.group
  end

  def update
    @event.update(event_params)
    redirect_to @event.progress == 100 ? event_path(@event) : edit_event_path(@event)
  end

  def destroy
    Event.find(params[:id]).destroy!
    redirect_to events_path, notice: 'Event was successfully cancelled!'
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
