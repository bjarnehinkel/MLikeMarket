class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def show
    @products = Product.find(params[:id])
  end

  def index
    @brand = Brand.find(params[:brand_id])
    @cat = Category.find(params[:category_id])
    @products = Product.where("category_id = #{@cat.id}")
  end
end
