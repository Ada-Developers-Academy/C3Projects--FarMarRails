class SalesController < ApplicationController

  def new
    @sale = Sale.new
    @vendor_id = params[:vendor_id]
    @url = "/vendors/#{@vendor_id}/sales"
  end

  def create
    @sale = Sale.create(create_params[:sale])
    redirect_to "/vendors/#{@sale.vendor_id}"
  end

  def show

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
