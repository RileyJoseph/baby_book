class EventsController < ApplicationController

  before_action :is_authenticated?


    def index
      baby_id = (params[:baby_id]).to_i

      if current_user.babies.ids.include?(baby_id)
        @baby = Baby.find(params[:baby_id])
        @events = @baby.events
        # map through the events array to get media related to each event
        @media = @events.map do |event|
          # event.media is an array of media
          if event.media.any?
            pic = event.media.first.url
            media = Cloudinary::Utils.cloudinary_url pic+".jpg", width: 410, height: 232, crop: :fill, gravity: :face
            thumb = Cloudinary::Utils.cloudinary_url pic+".jpg", width: 24, height: 24, crop: :fill, gravity: :face
          else
            media = ""
            thumb = ""
          end
          {media: media, thumb: thumb}
        end
        gon.baby = @baby
        gon.birthday = @baby.birthday.strftime("%A, %B %e, %Y")
        gon.bornDate = @baby.birthday.strftime("%Y,%m,%e")
        gon.events = @events
        gon.media = @media
      else
        flash[:danger] = "You cannot view this page"
        # redirect_to root_path
      end

    end


    def show
      baby_id = (params[:baby_id]).to_i

      if current_user.babies.ids.include?(baby_id)
        @baby = Baby.find(params[:baby_id])
        @event = Event.find(params[:id])
        @media = Event.find(params[:id]).media
        render layout: false
      else
        flash[:danger] = "You cannot view this page"
        redirect_to root_path
      end

    end


    def new
      baby_id = (params[:baby_id]).to_i

      if current_user.babies.ids.include?(baby_id)
        @event = Event.new
        @baby = Baby.find(params[:baby_id])
        render layout: false
      else
        flash[:danger] = "You cannot view this page"
        redirect_to root_path
      end

    end


    def create
        @baby = Baby.find(params[:baby_id])
        @baby.events.create(event_params)
        redirect_to baby_events_path
    end

    def edit
        @baby = Baby.find(params[:baby_id])
        @event = @baby.events.find(params[:id])
        render layout: false
    end


    def update
      @event = Event.find(params[:id])
      @event.update(event_params)
      redirect_to baby_events_path
    end


    def destroy
       @event = Event.find(params[:id])
       @media = Event.find(params[:id]).media
       p @media
       @media.destroy_all
       @event.destroy

       redirect_to baby_events_path
  end


  private

  def event_params
    params.require(:event).permit(:date,:topic,:body,:id)
  end

end