class SalesController < ApplicationController

  def new
    @page = "New Sale"
    @sale = Sale.new
    @vendor_id = params[:vendor_id]
    @url = "/vendors/#{@vendor_id}/sales"
  end

  def create
    p = create_params[:sale]
    p[:amount] = p[:amount].to_f * 100
    @sale = Sale.create(p)
    redirect_to "/vendors/#{@sale.vendor_id}"
  end

  def index
    @page = "Show Sales"
    @vendor_id = params[:vendor_id]
    @vendor = Vendor.find(@vendor_id)
    @vendor_sales = Sale.where(vendor_id: "#{@vendor_id}")
  end

  def show
    @page = "Show Sales"
    @vendor_id = params[:vendor_id]
    @vendor = Vendor.find(@vendor_id)
    @vendor_sales = Sale.where(vendor_id: "#{@vendor_id}")
    @current_month = Time.now.month

    @month_vendor_sales = []
    @vendor_sales.each do |sale|
      if sale.purchase_time.month == @current_month
        @month_vendor_sales.push(sale)
      end
    end

  end




##################### PRIVATE METHODS #####################
  private

  def find_sale
      id = params[:id]
      @sale = Sale.find(id)
  end

  def create_params
    params.permit(sale: [:id, :amount, :purchase_time, :vendor_id, :product_id])
  end


end
