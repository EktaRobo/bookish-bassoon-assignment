module ClientsHelper
    def refresh_client_orders
        @orders = Client.find(current_user.id).orders
    end
end
