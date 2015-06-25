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
    edited_market = create_params[:market]

    if Market.new(edited_market).valid?
      market.update(edited_market)

      # update when market#show is created
      redirect_to "/markets/#{ id }/dashboard"
    else
      redirect_to "/markets/#{ id }/edit/error"
    end
  end

  def error
  end

  private

  def create_params
    params.permit(market: [:name, :address, :city, :county, :state, :zipcode])
  end
end #class
