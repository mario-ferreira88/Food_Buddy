class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
    @restaurant = @event.restaurant
  end

  def update
    @event = Event.find(params[:id])
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

  private

  def event_params
    params.require(:event).permit(:name, :date, :restaurant_id)
  end

  def find_event
    @event = Event.find(params[:id])
  end
end
