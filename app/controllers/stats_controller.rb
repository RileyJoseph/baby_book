class StatsController < ApplicationController

  before_action :is_authenticated?


  def index
    baby_id = (params[:baby_id]).to_i

    if current_user.babies.ids.include?(baby_id)
      @baby = Baby.find(params[:baby_id])
      @stats = Baby.find(params[:baby_id]).stats
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
    baby_id = (params[:baby_id]).to_i

    if current_user.babies.ids.include?(baby_id)
      @baby = Baby.find(params[:baby_id])
      @stat = Stat.create(stat_params)
      @baby.stats << @stat
      redirect_to baby_stats_path
    else
      flash[:danger] = "You cannot view this page"
      redirect_to root_path
    end

  end


  private

  def stat_params
    params.require(:stat).permit(:height,:weight, :date)
  end

  def baby_params
    params.require(:baby).permit(:name,:birthday, :id)
  end

end
