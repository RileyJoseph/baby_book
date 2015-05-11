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

    # params[:url] is an array of the image urls
    preloaded_array = params[:url]

    p "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ preloaded_array"
    p preloaded_array
    puts "Images: " + preloaded_array.length.to_s

    # render json: params

    p "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ BABY"
    p @baby
    p "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ EVENT"

    if preloaded_array.present?

    p @event
    p "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ SAVING TO MEDIUM MODEL NOW"

      preloaded_array.each do |image|
        # create json object of image's data
        cloudinary_file = Cloudinary::PreloadedFile.new(image)

        p "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ IMAGE INSTANCE BEING STORED"
        p cloudinary_file

        # add image to media model
        @event.media.find_or_create_by(url: cloudinary_file.public_id)
      end
    end
    redirect_to baby_event_path(@baby,@event)
  end

  def medium_params
    params.require(:medium).permit(:url)
  end

end