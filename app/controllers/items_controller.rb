class ItemsController < ApplicationController
  attr_accessor :produt_name
  def initialize
    @product
  end
  def show
    item_list = Product.where(status: "Y")
    @product = ({"item_list": item_list})
    #render :json => @product
    respond_to do |format|
      format.html
      format.json  { render json: @product}
    end
  end
end
