class MarketsController < ApplicationController
  def index
    @markets = Market.all

  end

  def show
    @market = Market.find(params[:id])
  end

  def new
    @market = Market.new

    render :add_market
  end

  def create
    @market = Market.new(create_params[:market])
    @market.save

    render :index
  end

  def edit
    @market = Market.find(params[:id])

    render :edit_market
  end

  def update
    @market = Market.find(params[:id])
      new_name    = params[:market][:name]
      new_address = params[:market][:address]
      new_city    = params[:market][:city]
      new_county  = params[:market][:county]
      new_state   = params[:market][:state]
      new_zip     = params[:market][:zip]

    @market.update(name:    new_name,
                   address: new_address,
                   city:    new_city,
                   county:  new_county,
                   state:   new_state,
                   zip:     new_zip
                  )

    render :show
  end

  private

  def create_params
    params.permit(market: [:name, :address, :city, :county, :state, :zip])
  end
end
