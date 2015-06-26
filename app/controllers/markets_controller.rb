class MarketsController < ApplicationController
  def index
    @markets = Market.all
  end

  def login
    id = params.permit(:login_id)[:login_id].to_i

    if (id <= Market.last.id && id > 0)
      redirect_to "/markets/#{ id }/dashboard"
    else
      redirect_to "/markets/market_not_found"
    end
  end

  def dashboard
    @market = Market.find(params[:id])
    @vendors = @market.vendors
  end

  def market_not_found; end

  def show
    @market = Market.find(params[:id])
    @vendors = @market.vendors
  end

  def new
    @market = Market.new
  end

  def create
    market = Market.new(create_params[:market])

    if market.valid?
      market.save

      redirect_to "/markets/#{ market.id }/dashboard"
    else
      redirect_to "/markets/new/error"
    end
  end

  def edit
    @market = Market.find(params[:id])
  end

  def update
    market = Market.find(params[:id])
    edited_market = create_params[:market]

    if Market.new(edited_market).valid?
      market.update(edited_market)

      redirect_to "/markets/#{ market.id }/dashboard"
    else
      redirect_to "/markets/#{ market.id }/edit/error"
    end
  end

  def error; end

  private

  def create_params
    params.permit(market: [:name, :address, :city, :county, :state, :zipcode])
  end
end #class
