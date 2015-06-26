class SalesController < ApplicationController
  def index
    @vendor = Vendor.find(params[:vendor_id])
    @sales = @vendor.recent_sales_first

    if @sales.length == 0
      render :empty
    end
  end

  def current_month
    @vendor = Vendor.find(params[:vendor_id])
    @sales = @vendor.month_recent_sales_first

    @header = "#{Date::MONTHNAMES[Date.today.month]}'s Sales"
    @link_name = "View All Sales"
    @link = "/vendors/#{ @vendor.id }/sales"

    if @sales.length == 0
      render :empty
    else
      render :index
    end
  end

  def new
    @sale = Sale.new
    @vendor = Vendor.find(params[:vendor_id])
  end

  def create
    sale_params = create_params[:sale]
    # user input is given in dollars, but the database stores money in whole cents.
    sale_params[:amount] = convert_dollars_to_cents(sale_params[:amount])

    sale = Sale.new(sale_params)

    if sale.valid?
      sale.save

      redirect_to "/vendors/#{ sale.vendor_id }/sales"
    else
      redirect_to "/vendors/#{ sale.vendor_id }/sales/new/error"
    end
  end

  def error; end

  private

  def create_params
    params.permit(sale: [:amount, :purchase_time, :vendor_id,  :product_id])
  end

  def convert_dollars_to_cents(dollar_amount)
    # converting from user's string input into a float for mathematical operations.
    # if the user provides a non-numeric string, it will become 0.0.
    cent_amount = dollar_amount.to_f * 100
    cent_amount = cent_amount.to_i

    # for bad input, replaces the zero with a string that ActiveRecord will recognize as NaN.
    return cent_amount == 0 ? "zero" : cent_amount
  end
end # class
