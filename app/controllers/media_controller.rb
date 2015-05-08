class MediaController < ApplicationController

  def new
    @baby = Baby.find(params[:baby_id])
    @event = Event.find(params[:event_id])
    @medium = Medium.new
  end

  def create
    # uploaded_file = params[:baby][:event].path
    # cloudnary_file = Cloudinary::Uploader.upload(uploaded_file)

    # render json: cloudnary_file

        # create cloudinary url with specific event_id through carrierwave
    # @event = Event.find(params[:event_id])
    # @event.media.create(medium_params)
    # redirect_to baby_events_path(@baby)

    cloudnary_file = Cloudinary::Uploader.upload(medium_params)
    render json: cloudnary_file

  end

  def medium_params
    params.require(:medium).permit(:url.to_s)
  end

end