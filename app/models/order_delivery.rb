class OrderDelivery
  include ActiveModel::Model
  attr_accessour :user_id, :item_id, :post_code, :area_id, :city, :address, :building_name, :phone_number, :user_item
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :area_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :city
    validates :address
    validates :user_item
  end
   with_options presence: true, format {with: /\A\d{10,11}\z/, message: "is too short" do
    validates :phone_number, numericality: {only_integer: true, message: "is invalid. Input only number"}
  end
end