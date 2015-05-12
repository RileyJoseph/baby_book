class EventsController < ApplicationController

  before_action :is_authenticated?


    def index
      baby_id = (params[:baby_id]).to_i

      if current_user.babies.ids.include?(baby_id)
        @baby = Baby.find(params[:baby_id])
        @events = Baby.find(params[:baby_id]).events
      else
        flash[:danger] = "You cannot view this page"
        # redirect_to root_path
      end

    end


    def show
      baby_id = (params[:baby_id]).to_i

      # images
      @media = Event.find(params[:id]).media

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