class OrderShipping

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :address1, :address2, :building_name, :telephone, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :address1
    validates :address2
    validates :telephone, format: {with: /\A[0-9]{10,11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  
  def save
    binding.pry
    order = Order.create(user_id: user_id, item_id: item_id)

    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, address1: address1, address2: address2, building_name: building_name, telephone: telephone, order_id: order.id)
  end
end