class MediaController < ApplicationController

  def new
    @baby = Baby.find(params[:baby_id])
    @event = Event.find(params[:event_id])
    @medium = Medium.new
  end

  def create

  end

end