class MediaController < ApplicationController

  def index
    @event = Event.find(params[:event_id])
    @media = Event.find(params[:event_id]).media
    @baby = Baby.find(params[:baby_id])
  end

  def new
    baby_id = (params[:baby_id]).to_i

    if current_user.babies.ids.include?(baby_id)
      @baby = Baby.find(params[:baby_id])
      @event = Event.find(params[:event_id])
      @medium = Medium.new
    else
      flash[:danger] = "You cannot view this page"
      redirect_to root_path
    end
  end

  def create
    @baby = Baby.find(params[:baby_id])
    @event = Event.find(params[:event_id])

    # array of cloudinary public id for images
    preloaded_array = params[:url]

    if preloaded_array == []
      flash[:danger] = "Please add photos next time"
      new_baby_event_medium_path(@baby, @event)
    end

    preloaded_array.each do |public_id|
      @event.media.find_or_create_by(url: public_id)
    end

    redirect_to baby_events_path(@baby)
  end

  def destroy
    @event = Event.find(params[:event_id])
    @media = Event.find(params[:event_id]).media
    @medium = @media.find(params[:id])
    @medium.destroy
    redirect_to baby_event_media_path
  end

  private

  def medium_params
    params.require(:medium).permit(:url, :event_id, :id)
  end

end