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
    @market.update(market_params)
    redirect_to market_path
  end

  def new
    @market = Market.new
    render :new
  end

  def create
    Market.create(market_params)
    redirect_to markets_path
  end

  def vendors_index
    @market = Market.find(params[:id])
    @vendors = @market.vendors
    render :vendors_index
  end
  #
  # def vendor_show
  #   @vendor = Vendor.find(params[:vendor_id])
  #   @market = Market.find(params[:id])
  #   render :vendor_show
  # end
  #
  # def vendor_new
  #   render :vendor_new
  # end
  #
  # def vendor_create
  #   Vendor.create(form_params[:vendor])
  #   redirect_to vendors_market_path
  # end
  #
  # def vendors_edit
  #   @vendor = Vendor.find(params[:vendor_id])
  #   render :vendors_edit
  # end
  #
  # def vendor_update
  #   @vendor = Vendor.find(params[:vendor_id])
  #   @vendor.update(form_params[:vendor])
  #   redirect_to vendor_market_path
  # end
  #
  # def vendors_delete
  #   @vendor = Vendor.find(params[:vendor_id])
  # end
  #
  # def vendors_destroy
  #   @vendor = Vendor.find(params[:vendor_id])
  #   @vendor.destroy
  #   redirect_to vendors_market_path
  # end

  private

  def market_params
    params.require(:market).permit(:name, :address, :city, :county, :state, :zip)
  end

end
