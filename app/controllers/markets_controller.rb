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
    @vendor = Vendor.find(params[:vendor_id])
    @market = Market.find(params[:id])
    render :vendor_show
  end

  def vendor_new
    # Rails can't access VendorsController
    # @vendor = Vendor.new
    @market = Market.find(params[:id])
    render :vendor_new
  end

  def vendor_create
    # Rails can't access VendorsController
    @market = Market.find(params[:id])
    @vendor = @market.vendors.new(form_params[:vendor])
    @vendor.save
    redirect_to vendors_market_path
  end

  def vendors_edit
    # @market = Market.find()
    # @vendor = @market.vendors.find(params[:id])
    @market = Market.find(params[:id])
    @vendor = Vendor.find(params[:vendor_id])

    # @vendor = @market.vendors.find(params[:id])
    render :vendors_edit
  end

  def vendor_update
    # Rails can't access VendorsController
    @market = Market.find(params[:id])
    @vendor = @market.vendors.find(params[:vendor_id])
    @vendor.update(form_params[:vendor])
    redirect_to vendor_market_path
  end

  def vendors_delete
    @vendor = Vendor.find(params[:vendor_id])
  end

  def vendors_destroy
    @market = Market.find(params[:id])
    @vendor = @market.vendors.find(params[:vendor_id])
    @vendor.destroy
    redirect_to vendors_market_path
  end

  private

  def form_params
    params.permit(market: [:name, :address, :city, :county, :state, :zip], vendor: [:name, :num_employees, :market_id, :_destroy])
  end

end
