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
  end

  private

  def baby_params
    params.require(:creature).permit(:name,:birthday)
  end

end