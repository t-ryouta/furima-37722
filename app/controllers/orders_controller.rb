class OrdersController < ApplicationController
  def index
    @order_delivery = OrderDelivery.new
  end

  def create
    @items = Item.all
    @items = Item.find(params[:item_id])
    @order_delivery = OrderDelivery.new(order_params)
    if @order_delivery.valid?
      @order_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_delivery).permit(:post_code, :area_id, :city, :address, :building_name, :phone_number, :order).merge(user_id: current_user.id)
  end
end
