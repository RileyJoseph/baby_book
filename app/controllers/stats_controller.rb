class StatsController < ApplicationController

  def index
    @stats = Baby.find(params[:baby_id]).stats
  end

  def new
    @stat = Stat.new
    @baby = Baby.find(params[:baby_id])
  end

  def show
    @stat = Stat.find(params[:id])
  end

  def create
    @baby = Baby.find(params[:baby_id])
    @stat = Stat.create(stat_params)
    @baby.stats << @stat
    redirect_to baby_stats_path
  end

  private

  def stat_params
    params.require(:stat).permit(:height,:weight, :date)
  end

  def baby_params
    params.require(:baby).permit(:name,:birthday, :id)
  end

end
