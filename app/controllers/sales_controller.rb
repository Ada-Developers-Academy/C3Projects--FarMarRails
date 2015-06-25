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
  end

  def create
    sale = Sale.new(create_params[:sale])
    sale.save

    redirect_to "/vendors/#{ sale.vendor_id }/sales"
  end

  private

  def create_params
    params[:sale][:amount] *= 100

    params.permit(sale: [:amount, :purchase_time, :vendor_id,  :product_id])
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
