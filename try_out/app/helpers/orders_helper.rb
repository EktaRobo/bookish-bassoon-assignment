module OrdersHelper
    def get_name order
        if ( current_user.user_type == "Grocer" )
            client = Client.find(order.client_id)
            client.name
        else
            grocer = Grocer.find(order.grocer_id)
            grocer.name
        end
    end

    def delete_order order
         order.destroy
    end

    def get_order_status_name order
        order_status = OrderStatus.find(order.order_status_id)
        order_status.status
    end
end
