class MarketsController < ApplicationController
  def index
    @markets = Market.all
    render :index
  end

  def show
    @market = Market.find(params[:id])
    render :show
  end

  def vendors_index
    @market = Market.find(params[:id])
    @vendors = @market.vendors
    render :vendors_index
  end

  def vendor_show
    @vendor = Vendor.find(params[:id])
  end

  def edit
    @market = Market.find(params[:id])
    render :edit
  end

  def update
    @market = Market.find(params[:id])
    @market.update(form_params[:market])
    redirect_to market_path
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
