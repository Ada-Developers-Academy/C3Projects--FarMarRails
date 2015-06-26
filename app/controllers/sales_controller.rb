class SalesController < ApplicationController
  def new
    @sale = Sale.new(vendor_id: params[:id], product_id: params[:product_id])
    render 'sales/new'
  end

  def create
    Sale.create(create_sale_params[:sale])

    redirect_to sales_vendor_path(id: create_sale_params[:sale][:vendor_id])
  end

  private

  def create_sale_params
    params.permit(sale: [:amount, :purchase_time, :vendor_id, :product_id])
  end
end
