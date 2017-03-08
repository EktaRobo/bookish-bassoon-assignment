module OrdersHelper
    def get_grocer_name order
        grocer = Grocer.find(order.grocer_id)
        grocer.name
    end
end
