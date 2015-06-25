class SalesController < ApplicationController

  def index
    @vendor = Vendor.find(params[:vendor_id])
    @vendor_sales = @vendor.sales
    render :index
  end

  def create
    @vendor = Vendor.find(params[:vendor_id])
    @url = "/vendors/#{@vendor.id}/sales"

    @sale = Sale.new(create_params[:sale])
    @sale.save

    redirect_to vendor_sales_path(@vendor.id)
  end

  def new
    @vendor = Vendor.find(params[:vendor_id])
    @sale = Sale.new
    @url = "/vendors/#{@vendor.id}/sales"

    render :new
  end

  def edit
  end

  def show
  end

  def update
  end

  private

  def create_params
    params.permit(sale: [:amount, :purchase_time, :product_id, :vendor_id])
  end
end
