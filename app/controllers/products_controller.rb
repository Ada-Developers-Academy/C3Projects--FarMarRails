class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  private
    def set_product
      @product = Product.find(params[:id])
    end
end
