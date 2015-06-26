class UsersController < ApplicationController

  def index
    render :index
  end

  def show
    @markets = Market.all

    render :all_markets
  end

  def market_details
    @market_id =params[:id]
    @market = Market.find(@market_id)

    render :market_show
  end

  def name_sort
    @markets = Market.order(:name)

    render :all_markets
  end

  def city_sort
    @markets = Market.order(:city)

    render :all_markets
  end

  def state_sort
    @markets = Market.order(:state)
    
    render :all_markets
  end

end
