class EventsController < ApplicationController

  before_action :is_authenticated?


    def index
      baby_id = (params[:baby_id]).to_i

      if current_user.babies.ids.include?(baby_id)
        @baby = Baby.find(params[:baby_id])
        @events = Baby.find(params[:baby_id]).events
      else
        flash[:danger] = "You cannot view this page"
        redirect_to root_path
      end

    end


    def show
      baby_id = (params[:baby_id]).to_i

      if current_user.babies.ids.include?(baby_id)
        @baby = Baby.find(params[:baby_id])
        @event = Event.find(params[:id])
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
      else
        flash[:danger] = "You cannot view this page"
        redirect_to root_path
      end

    end


    def create
      baby_id = (params[:baby_id]).to_i

      if current_user.babies.ids.include?(baby_id)
        @baby = Baby.find(params[:baby_id])
        @baby.events.create(event_params)
        redirect_to baby_events_path
      else
        flash[:danger] = "You cannot view this page"
        redirect_to root_path
      end

    end



  private

  def event_params
    params.require(:event).permit(:date,:topic,:body,:id)
  end

end