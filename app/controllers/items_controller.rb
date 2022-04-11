class ItemsController < ApplicationController
  def index
    @items = Item.order(id: :DESC)
  end

  def new
    @item = Item.new
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:goods, :catch_copy, :category_id, :condition_id, :burden_id, :area_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
