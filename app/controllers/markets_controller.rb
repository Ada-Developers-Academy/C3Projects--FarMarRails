class MarketsController < ApplicationController

  def index
    @markets = Market.all
  end

  def create
    @market = Market.new(permit_params[:market])
    @market.save

    redirect_to(markets_path)
  end

  def new
    @market = Market.new()
  end

  def show
    @market = Market.find(params[:id])

    @vendors = Vendor.where(:market_id => params[:id])
  end

  def edit #GET one market to modify.
   @market = Market.find(params[:id])   
  end

  def update #PATCH this updated market to the db
    @market = Market.find(params[:id]) 
    @market.name = permit_params[:market][:name]
    @market.street_address = permit_params[:market][:street_address]
    @market.city = permit_params[:market][:city]
    @market.county = permit_params[:market][:county]
    @market.state = permit_params[:market][:state]
    @market.zip = permit_params[:market][:zip]
    @market.save
    
    redirect_to(markets_path) 
  end

  private

  def permit_params
    params.permit(market:[:name,:street_address,:city, :county, :state, :zip])
  end


end
