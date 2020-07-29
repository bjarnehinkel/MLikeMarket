class BrandsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @brand = Brand.find(params[:id])
  end
end
