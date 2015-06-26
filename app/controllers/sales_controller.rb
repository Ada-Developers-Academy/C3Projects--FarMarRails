class SalesController < ApplicationController
  def index
    @vendor = Vendor.find(params.permit(:vendor_id)[:vendor_id])
    @sales = @vendor.recent_sales_first

    if @sales.length == 0
      render ":empty"
    end
  end

  def current_month
    @vendor = Vendor.find(params.permit(:vendor_id)[:vendor_id])
    @sales = month_sales(@vendor)
    @header = "#{Date::MONTHNAMES[Date.today.month]}'s Sales"
    @link_name = "View All Sales"
    @link = "/vendors/#{@vendor.id}/sales"

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
    params = create_params[:sale]
    params[:amount] = convert_dollars_to_cents(params[:amount])

    sale = Sale.new(params)

    if sale.valid?
      sale.save

      redirect_to "/vendors/#{ sale.vendor_id }/sales"
    else
      redirect_to "/vendors/#{ sale.vendor_id }/sales/new/error"
    end
  end

  def error
  end

  private

  def create_params
    params.permit(sale: [:amount, :purchase_time, :vendor_id,  :product_id])
  end

  def convert_dollars_to_cents(dollar_amount)
    cent_amount = dollar_amount.to_f * 100
    cent_amount = cent_amount.to_i

    return cent_amount == 0 ? "zero" : cent_amount
  end

  def month_sales(vendor)
    current_month = Time.now.month
    sales = []

    vendor.sales.each do |sale|
      sales.push(sale) if sale.purchase_time.month == current_month
    end

    return sales
  end
end
