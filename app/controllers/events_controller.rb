class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
  end


## I want to create a new event and show it to the user
  def new
    @event = Event.new
  end

  def edit
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
