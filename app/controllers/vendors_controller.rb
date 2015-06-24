class VendorsController < ApplicationController

	def index
		@vendors = Vendor.all
	end

	def new
		@vendor = Vendor.new
	end

	def create
		@vendor = Vendor.create(create_params[:vendor])
    redirect_to "/markets/#{@vendor.market_id}"
	end

##################### PRIVATE METHODS #####################
  private

  def find_vendor
      id = params[:id]
      @vendor = Vendor.find(id)
  end

  def create_params
    params.permit(vendor: [:id, :name, :num_employees, :market_id])
  end

end
