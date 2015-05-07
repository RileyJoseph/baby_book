class EventsController < ApplicationController

  def index
    # @events = Event.all
    @events = Baby.find(params[:baby_id]).events
  end

  def show
    @event = Event.find(params[:id])
    render :json => @event
  end

  def new
    @event = Event.new
    @baby = Baby.find(params[:baby_id])
  end

  def create
    @baby = Baby.find(params[:baby_id])
    # render :json => @baby

    @baby.events.create(event_params)
    # @event = Event.create(event_params)
    redirect_to baby_events_path
  end

  private

  def event_params
    params.require(:event).permit(:date,:topic,:body)
  end

end