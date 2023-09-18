class OrderShipping < ApplicationRecord

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :address1, :address2, :building_name, :telephone, :user_id, :item_id, :token

  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, address1: address1, address2: address2, building_name: building_name, telephone: telephone, order_id: order.id)
  end
end