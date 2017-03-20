class Grocer < User
    has_many :items
    has_many :orders
    has_many :carts, through: :orders, source: :carts
end
