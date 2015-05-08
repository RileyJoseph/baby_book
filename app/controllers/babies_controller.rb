class BabiesController < ApplicationController

  before_action :is_authenticated?


  def index
    @babies = current_user.babies
  end


  def new
    @baby = Baby.new
  end


  def show

    if current_user.babies.ids.include?(current_baby)
      @baby = Baby.find(params[:id])
      @birthday = @baby.birthday.strftime("%A, %B %e, %Y")
    else
      flash[:danger] = "You cannot view this page"
      redirect_to root_path
    end

  end


  def create
    @baby = current_user.babies.create(baby_params)
    redirect_to @baby
  end


  private

  def baby_params
    params.require(:baby).permit(:name,:birthday)
  end

end