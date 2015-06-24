class VendorsController < ApplicationController
  before_action :set_vendor, only: [:show]

  def index
    @vendors = Vendor.all
  end

  private
    def set_vendor
      @vendor = Vendor.find(params[:id])
    end

    def vendor_params
      params.permit(vendor: [:name, :num_employees, :market_id] )[:vendor]
    end
end
