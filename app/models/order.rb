class Order < ApplicationRecord
  belongs_to :item
  belongs_to :user
  validates :price, presence: true
  # has_one :shipping
end