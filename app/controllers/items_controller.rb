class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.order(id: :DESC)
  end

  def new
    @item = Item.new
    redirect_to '/users/sign_in' unless user_signed_in?
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
  end

  def edit
    if @item.user_id == current_user.id || @item.order.nil?
      redirect_to root_path
    end
  end

  def destroy
   unless current_user.id == @item.user_id
    redirect_to root_path
   end
   @item.destroy
   redirect_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:goods, :catch_copy, :category_id, :condition_id, :burden_id, :area_id, :delivery_day_id,
                                 :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
