class OrderDelivery
  include ActiveModel::Model
  attr_accessour :user_id, :item_id, :post_code, :area_id, :city, :address, :building_name, :phone_number, :user_item
end