class Api::V1::ItemsController < ApplicationController
  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def destroy
    render json: Item.delete(params[:id])
  end

  def create

  end

  private

  def item_params
    params.require(:item).permit(:)
  end
end
