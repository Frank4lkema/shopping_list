# frozen_string_literal: true

class ProductsController < ApplicationController
  def create
    @product = Product.create!(product_params)
  end

  def update
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.permit(:name, :standard)
  end
end
