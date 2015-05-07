class EventsController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  private

  def event_params
    params.require(:event).permit(:date,:topic,:body)
  end

end