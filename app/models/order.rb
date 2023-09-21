class Order < ApplicationRecord
  attr_accessor :token
  belongs_to :item
  belongs_to :user
  has_one :shipping
  validates :price, presence: true
  validates :token, presence: true
end