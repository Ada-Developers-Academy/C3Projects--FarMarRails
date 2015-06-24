class MarketsController < ApplicationController

  def index

    @markets = Market.all

    render :index
  end

  def show

    @market = Market.find(params[:id])
    @display_vendors = @market.vendors

    render :show
  end

  def new
    @market = Market.new
  end

  def create
    @market = Market.create(create_params[:market])

    redirect_to markets_path
  end

  def edit
    @market = Market.find(params[:id])
  end

  def update
    @market = Market.find(params[:id])
    @market.update(create_params[:market])

    redirect_to market_path
  end

  private

  def create_params
    params.permit(market: [:name, :address, :city, :county, :state, :zip])

  end

end
