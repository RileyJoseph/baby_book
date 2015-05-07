class StatsController < ApplicationController

  def index
    babies = Baby.find
    p babies
    baby = Baby.find_by_id(params[:id])
    p baby
    @stat = Stat.find_by_id(params[:id])
    p @stat
  end

  def new
    @stat = Stat.new
  end

  # def show
  #   @stat = Stat.find(params[:id])
  # end

  # def create
  #   @stat = Stat.create(stat_params)
  #   redirect_to @stat
  # end

  private

  def stat_params
    params.require(:stat).permit(:height,:weight, :baby_id)
  end

  def baby_params
    params.require(:baby).permit(:name,:birthday,:id)
  end

end
