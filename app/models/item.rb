class Item < ApplicationRecord
  belongs_to :user
  # has_many :comments
  # has_many :likes
  # has_one :order
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping
  belongs_to :prefecture
  belongs_to :schedule

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :schedule_id, numericality: { other_than: 1 , message: "can't be blank"}

end
