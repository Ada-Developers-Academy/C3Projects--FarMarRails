class MarketsController < ApplicationController
  def index
    @markets = Market.all
    render :index
  end

  def show
    @market = Market.find(params[:id])
    render :show
  end

  def vendors
    @market = Market.find(params[:id])
    @vendors = @market.vendors
    render :vendors
  end

  def new
    @market = Market.new
    render :new
  end

  def create
    @market = Market.create(form_params[:market])
    redirect_to markets_path
  end

  private

  def form_params
    params.permit(market: [:name, :address, :city, :county, :state, :zip])
  end

end
