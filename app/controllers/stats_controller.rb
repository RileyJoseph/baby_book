class StatsController < ApplicationController

  before_action :is_authenticated?

  def index
    baby_id = (params[:baby_id]).to_i

    if current_user.babies.ids.include?(baby_id)
      @baby = Baby.find(params[:baby_id])
      @stats = @baby.stats
      @last_three = @baby.stats.order(date: 'desc').limit(3)
      @gender = @baby.gender
      gon.gender = @gender
    else
      flash[:danger] = "You cannot view this page"
      redirect_to root_path
    end
  end

  def new
    baby_id = (params[:baby_id]).to_i

    if current_user.babies.ids.include?(baby_id)
      @stat = Stat.new
      @baby = Baby.find(params[:baby_id])
      render layout: false
    else
      flash[:danger] = "You cannot view this page"
      redirect_to root_path
    end
  end

  def show
    baby_id = (params[:baby_id]).to_i

    if current_user.babies.ids.include?(baby_id)
      @stat = Stat.find(params[:id])
    else
      flash[:danger] = "You cannot view this page"
      redirect_to root_path
    end
  end

  def create
    @baby = Baby.find(params[:baby_id])
    @stat = Stat.create(stat_params)
    @baby.stats << @stat
    @last_three = @baby.stats.order(date: 'desc').limit(3)
    @stats = @baby.stats.order(date: 'asc')
    render partial: 'stats'
  end

  def all_modal
    @baby = Baby.find(params[:baby_id])
    @stats = @baby.stats.order(date: 'asc')
    render layout: false
  end

  private

  def stat_params
    params.require(:stat).permit(:height,:weight, :date)
  end

  def baby_params
    params.require(:baby).permit(:name,:birthday, :id)
  end
end
