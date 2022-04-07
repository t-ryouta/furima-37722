class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:goods, :catch_copy, :category_id, :condition_id, :burden_id, :area_id, :delivery_day_id, :price)
  end
end
