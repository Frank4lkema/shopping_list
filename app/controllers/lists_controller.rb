# frozen_string_literal: true

# lists controller
class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def create
    @list = List.create!(list_params)
  end

  def show
    @list = List.find(params[:id])
  end

  def destroy
    @list = List.find(params[:id])
  end

  private

  def list_params
    params.permit(:date)
  end
end
