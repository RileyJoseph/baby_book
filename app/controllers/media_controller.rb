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
    @baby = Baby.find(params[:baby_id])
    @event = Event.find(params[:event_id])

    # render json: params[:url]
    preloaded_array = params[:url]

    p "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ BABY"
    p @baby[:name]
    p "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ EVENT"
    p @event[:topic]
    p "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ preloaded_array"
    puts "Images: " + preloaded_array.length.to_s
    p "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ SAVING TO MEDIUM MODEL NOW"

    preloaded_array.each do |public_id|
      # add image to media model
      @event.media.find_or_create_by(url: public_id)
      p "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ IMAGE INSTANCE SAVED"
    end

    redirect_to baby_events_path(@baby)
  end

  def medium_params
    params.require(:medium).permit(:url)
  end

end