class BabiesController < ApplicationController

  before_action :is_authenticated?


  def index
    @babies = current_user.babies
    @babies.each do |baby|
      @last_stat = baby.stats.last
    end
  end


  def new
    @baby = Baby.new
    render layout: false
  end


  def show
    baby_id = (params[:id]).to_i

    if current_user.babies.ids.include?(baby_id)
      @baby = Baby.find(params[:id])
      @birthday = @baby.birthday.strftime("%A, %B %e, %Y")
      @last_stat = @baby.stats.order(date: 'desc').limit(1)
      render layout: false
    else
      flash[:danger] = "You cannot view this page"
      redirect_to root_path
    end
  end

  def create
    @baby = current_user.babies.create(baby_params)
    @babies = current_user.babies
    render partial: 'babies'
  end


  def edit
    @baby = Baby.find(params[:id])
    render layout: false
  end


  def update
    @baby = Baby.find(params[:id])
    @baby.update(baby_params)
    redirect_to babies_path
  end

  # todo, add baby destroy

  # def destroy
  #    @event = Event.find(params[:id])
  #    @media = Event.find(params[:id]).media
  #    p @media
  #    @media.destroy_all
  #    @event.destroy

  #    redirect_to baby_events_path
  # end


  private

  def baby_params
    params.require(:baby).permit(:name,:birthday,:gender,:profile_pic)
  end
end