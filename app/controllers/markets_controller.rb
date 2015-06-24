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

    redirect_to "/markets"
  end

  private

  def create_params
    params.permit(market: [:name, :address, :city, :county, :state, :zip])

  end

end
