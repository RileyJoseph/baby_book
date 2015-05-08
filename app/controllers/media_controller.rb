class MediaController < ApplicationController

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
    # render plain: params
    uploaded_file = params[:medium][:url].path
    cloudinary_file = Cloudinary::Uploader.upload(uploaded_file)

    # render json: cloudinary_file
    @baby = Baby.find(params[:baby_id])
    @event = Event.find(params[:event_id])
    # render json: @event
    @event.media.create url: cloudinary_file['public_id']

    # Medium.create url: cloudinary_file['public_id']
    redirect_to baby_event_path(@baby,@event)

  end

  def medium_params
    params.require(:medium).permit(:url)
  end

end