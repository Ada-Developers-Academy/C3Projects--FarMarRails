class SalesController < ApplicationController

  def new

    @sale = Sale.new

  end

  def create

    @sale = Sale.create(create_params[:sale])

    redirect_to vendor_path(params[:sale][:vendor_id])
  end

  private

  def create_params
    params.permit(sale: [:amount, :purchase_time, :vendor_id, :id])

  end

end
