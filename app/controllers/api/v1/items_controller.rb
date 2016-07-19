class Api::V1::ItemsController < ApplicationController

  def index
    # render json: Item.all
      @items = Item.all
  end

  def show
    # render json: Item.find(params[:id])
    @item = Item.find(params[:id])
  end

  def create
    render json: Item.create!(item_params)
  end

  def update
    render json: Item.update(params[:id], item_params)
    #status: 204 success, no content
  end

  private

  def item_params
    params.require(:item).permit(:name, :description)
  end

end
