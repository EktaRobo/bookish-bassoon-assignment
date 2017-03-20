module ItemsHelper
    def get_item_unit cart
        item = Item.find(cart.item_id)
        item.unit
    end
end
