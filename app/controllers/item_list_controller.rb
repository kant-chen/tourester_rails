class ItemListController < ApplicationController
  attr_accessor :produt_name
  def initialize
    @product_name
  end
  def items
    item_list = Product.where(status: "Y")
    @product_name = ({"item_list": item_list})
    render :json => @product_name
  end
end
