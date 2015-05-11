class StatsController < ApplicationController

  before_action :is_authenticated?
  require'csv'
  require'json'

  def render_data data
    data.to_a.map {|row| row.to_hash }
  end


  def index
    baby_id = (params[:baby_id]).to_i

    @csv = CSV.foreach(("male_length.csv"), :headers => true, :header_converters => :symbol)
    @csv1 = CSV.foreach(("female_length.csv"), :headers => true, :header_converters => :symbol)
    @csv2 = CSV.foreach(("male_weight.csv"), :headers => true, :header_converters => :symbol)
    @csv3 = CSV.foreach(("female_weight.csv"), :headers => true, :header_converters => :symbol)
    @data = render_data @csv
    @data1 = render_data @csv1
    @data2 = render_data @csv2
    @data3 = render_data @csv3
    if current_user.babies.ids.include?(baby_id)
      @baby = Baby.find(params[:baby_id])
      @stats = @baby.stats
      @last_three = @baby.stats.order(date: 'desc').limit(3)
    else
      flash[:danger] = "You cannot view this page"
      redirect_to root_path
    end

  end

  def is_int(str)
    # Check if a string should be an integer
    return !!(str =~ /^[-+]?[1-9]([0-9]*)?$/)
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
      # redirect_to baby_stats_path
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
