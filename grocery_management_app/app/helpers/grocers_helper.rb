module GrocersHelper
    def refresh_orders
        @orders = Grocer.find(current_user.id).orders
    end
end
