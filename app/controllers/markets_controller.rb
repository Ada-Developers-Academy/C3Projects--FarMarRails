class MarketsController < ApplicationController
  def index
    @markets = Market.all
  end

  def create
#POST
    @markets = Market.all
    @new = Market.new(create_params[:market])
    @new.save
    render :index
  end

  def new
#GET
    @new = Market.new
  end

  def edit
    @edit = Market.find(params[:id])
    render :edit
  end

  def show
    @market = Market.find(params[:id])
    @vendors = @market.vendors
    render :show
  end

  def update
    @market = Market.find(params[:id])
    @market.name = create_params[:market][:name]
    @market.address= create_params[:market][:address]
    @market.city = create_params[:market][:city]
    @market.county = create_params[:market][:county]
    @market.state = create_params[:market][:state]
    @market.zip = create_params[:market][:zip]
    @market.save
    redirect_to "/markets/#{@market.id}"
  end

private

def create_params
  params.permit(market: [:name, :address, :city, :county, :state, :zip, :vendor_id])
end

end
