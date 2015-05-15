class SiteController < ApplicationController

  before_action :current_user

  def index
    if @current_user
      redirect_to babies_path
    end
  end

  def about
  end
end