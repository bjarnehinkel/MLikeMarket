class BrandsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @brand = Brand.find(params[:id])
    @products = Product.where("brand_id = #{@brand.id}").sample(3)
  end
end
