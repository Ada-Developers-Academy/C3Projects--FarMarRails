class MarketsController < ApplicationController
  def index
    @markets = Market.all
    render :index
  end

  def show
    @market = Market.find(params[:id])
    render :show
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

  def vendors_index
    @market = Market.find(params[:id])
    @vendors = @market.vendors
    render :vendors_index
  end

  def vendor_show
    @vendor = Vendor.find(params[:id])
    render :vendor_show
  end

  def vendor_new
    # RAILS DOESN'T RECOGNIZE
    # @vendor = Vendor.new
    @market = Market.find(params[:id])
    render :vendor_new
  end

  def vendor_create
    # RAILS DOESN'T RECOGNIZE. THIS NEEDS TO HAPPEN INSIDE THE VENDORS CONTROLLER?
    @market = Market.find(params[:id])
    @vendor = @market.vendors.new(form_params[:vendor])
    @vendor.save
    redirect_to vendors_market_path
  end

  private

  def form_params
    params.permit(market: [:name, :address, :city, :county, :state, :zip], vendor: [:name, :num_employees, :market_id])
  end

end
