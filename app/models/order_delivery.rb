class OrderDelivery
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :area_id, :city, :address, :building_name, :phone_number
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :area_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :city
    validates :address
  end
   with_options presence: true, format: {with: /\A\d{10,11}\z/, message: "is too short" } do
    validates :phone_number, numericality: {only_integer: true, message: "is invalid. Input only number"}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Delivery.create(post_code: post_code, area_id: area_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end