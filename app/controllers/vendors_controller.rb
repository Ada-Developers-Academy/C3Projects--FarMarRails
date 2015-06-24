class VendorsController < ApplicationController

	def index
		@vendors = Vendor.all
		render :index
	end

end
