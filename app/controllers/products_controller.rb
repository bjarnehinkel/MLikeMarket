class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @products = Product.find(parmas[:id])
  end
end
