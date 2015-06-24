class VendorsController < ApplicationController

	def index
		@vendors = Vendor.all
	end

	def new
		@vendor = Vendor.new
		@market_id = params[:market_id]
		@url = market_vendors_path
	end

	def create
		@vendor = Vendor.create(create_params[:vendor])
    redirect_to "/markets/#{@vendor.market_id}"
	end

	def edit
		find_vendor
		@url = market_vendor_path
	end

	def update
		find_vendor
		@vendor.update(create_params[:vendor])

		redirect_to market_path(@vendor.market_id)
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
