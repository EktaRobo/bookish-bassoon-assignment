class Order < ApplicationRecord
  belongs_to :grocer
  belongs_to :client
  belongs_to :order_status
  has_many :carts, dependent: :destroy
end
