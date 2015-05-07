class BabiesController < ApplicationController

  def index
    @babies = Baby.all
  end

  def new
    @baby = Baby.new
  end

  def show
    @baby = Baby.find(params[:id])
  end

  def create
    @baby = Baby.create(baby_params)
    redirect_to @baby
  end

  private

  def baby_params
    params.require(:baby).permit(:name,:birthday)
  end

end