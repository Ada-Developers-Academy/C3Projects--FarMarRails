class SalesController < ApplicationController
  # before_action :set_sale, only: []
  before_action :set_vendor, only: [:new, :create]

  private
    # def set_sale
    #   @sale = Sale.find(params[:id])
    # end

    def set_vendor
      @vendor = Vendor.find(params[:vendor_id])
    end

    # TODO: decide if we need this
    # def set_product
    # end

    def sale_params
      params.permit(sale: [:amount, :purchase_time, :vendor_id, :product_id])[:sale]
    end
end
