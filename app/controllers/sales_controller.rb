class SalesController < ApplicationController
  def index
    @vendor = Vendor.find(params.permit(:vendor_id)[:vendor_id])
    @sales = @vendor.sales

    if @sales.length == 0
      render ":empty"
    end
  end

  def current_month
    @vendor = Vendor.find(params.permit(:vendor_id)[:vendor_id])
    @sales = month_sales(@vendor)

    if @sales.length == 0
      render :empty
    else
      render :sales
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
    sale.save

    redirect_to "/vendors/#{ sale.vendor_id }/sales"
  end

  private

  def create_params
    params.permit(sale: [:amount, :purchase_time, :vendor_id,  :product_id])
  end

  def convert_dollars_to_cents(dollar_amount)
    cent_amount = dollar_amount.to_f * 100
    cent_amount = cent_amount.to_i
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
