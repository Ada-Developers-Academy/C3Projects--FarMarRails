class MarketsController < ApplicationController

  def index
    @markets = Market.all
  end

  def new
    @market = Market.new
  end

  def create
    market = Market.new(create_params[:market])
    market.save
    redirect_to "/markets"
  end

  def edit
    @market = Market.find(params[:market_id])
  end

  def update
    market = Market.find(params[:market_id])
    edited_market = params[:market]

    market.update(
      name: edited_market[:name],
      address: edited_market[:address],
      city: edited_market[:city],
      county: edited_market[:county],
      state: edited_market[:state],
      zipcode: edited_market[:zipcode]
    )

    # update when market#show is created
    redirect_to "/markets/"
  end

  private

  def create_params
    params.permit(market: [:name, :address, :city, :county, :state, :zipcode])
  end
end
