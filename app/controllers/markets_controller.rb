class MarketsController < ApplicationController
  def index
    @markets = Market.all
  end

  def login
    if (params.permit(:login_id)[:login_id].to_i <= Market.last.id)
      id = params.permit(:login_id)[:login_id]
      redirect_to "/markets/#{ id }/dashboard"
    else
      redirect_to "/markets/market_not_found"
    end
  end

  def dashboard
    @market = Market.find(params.permit(:id)[:id])
    @vendors = @market.vendors
  end

  def market_not_found
  end

  def show
    id = params.permit(:id)[:id]
    @market = Market.find(id)
    @vendors = @market.vendors
  end

  def new
    @market = Market.new
  end

  def create
    market = Market.new(create_params[:market])

    if market.valid?
      market.save

      redirect_to "/markets"
    else
      redirect_to "/markets/new/error"
    end
  end

  def edit
    @market = Market.find(params[:id])
  end

  def update
    id = params[:id]

    market = Market.find(id)
    # NOTE: why aren't we using create_params here?
    edited_market = params[:market]

    if Market.new(edited_market).valid?
      market.update(
        name: edited_market[:name],
        address: edited_market[:address],
        city: edited_market[:city],
        county: edited_market[:county],
        state: edited_market[:state],
        zipcode: edited_market[:zipcode]
      )

      # update when market#show is created
      redirect_to "/markets/#{ id }/dashboard"
    else
      redirect_to "/markets/#{ id }/edit/error"
    end
  end

  private

  def create_params
    params.permit(market: [:name, :address, :city, :county, :state, :zipcode])
  end
end #class
