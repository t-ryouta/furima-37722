class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @order_delivery = OrderDelivery.new
    @items = Item.find(params[:item_id])
    if @items.user_id == current_user.id || @items.order != nil
      redirect_to root_path
    end
  end

  def create
    @items = Item.find(params[:item_id])
    @order_delivery = OrderDelivery.new(order_params)
    if @order_delivery.valid?
      pay_item
      @order_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_delivery).permit(:post_code, :area_id, :city, :address, :building_name,:phone_number).merge(user_id: current_user.id, item_id: @items.id, token:params[:token])
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @items.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
