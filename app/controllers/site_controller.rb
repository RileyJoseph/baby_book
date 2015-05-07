class SiteController < ApplicationController

  def index
    if @current_user
      redirect_to babies_path
    end
  end




end