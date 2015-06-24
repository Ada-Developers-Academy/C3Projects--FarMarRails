class ProductsController < ApplicationController

def index
  @vendor = Vendor.find(params[:vendor_id])
  @vendor_products = @vendor.products

  render :index
end

def create
end

def new
  
end

def edit
end

def show
end

def update
end

def destroy

end


private

def create_params
  params.permit(product: [:name, :vendor_id])
end

end
