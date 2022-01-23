# frozen_string_literal: true

class ListProductsController < ApplicationController
  def index
    @list = List.find(params[:list_id])
    @list_products = @list.list_products
  end

  def create
    @list_product = ListProduct.create!(list_product_params)
  end

  private

  def list_product_params
    params.permit(:amount, :product_id, :list_id)
  end
end
