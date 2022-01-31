# frozen_string_literal: true

# lists controller
class ListsController < ApplicationController
  def index
    @list = List.new
    @lists = List.all.future_lists.order(:date)
  end

  def create
    @list = List.create!(list_params)
  end

  def show
    @list = List.find(params[:id])
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy!
  end

  private

  def list_params
    params.require(:list).permit(:date)
  end
end
