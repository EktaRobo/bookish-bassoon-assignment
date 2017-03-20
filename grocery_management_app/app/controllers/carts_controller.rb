class CartsController < ApplicationController
  def create
    @cart = Cart.new(cart_params)
    @cart.save!
    order = Order.find(@cart.order_id)
    redirect_to item_units_left_url(:ordered_units => @cart.quantity, :id =>@cart.item_id, :grocer_id => order.grocer_id, :order_id => @cart.order_id)
  end

  def edit
    @cart = Cart.find(params[:id])
  end

  def update
    @cart = Cart.find(params[:id])
      if @cart.update(cart_params)
        # @carts = Cart.where(:order_id => @cart.order_id)
        # @order = Order.find(@cart.order_id)
        # render :partial => "/orders/items_in_order", :collection => { :carts => @carts, :order => @order }
        order_id = @cart.order_id
        redirect_to order_url(:id => order_id)
      else
        p "Failure"
      end
  end

  def destroy
    @cart = Cart.find(params[:id])
    # @carts = Cart.where(:order_id => @cart.order_id)
    # @order = Order.find(@cart.order_id)
    order_id = @cart.order_id
    @cart.destroy
    p "I'm getting destroyed"
    redirect_to order_url(:id => order_id)
    # render :partial => "/orders/items_in_order", :collection => { :carts => @carts, :order => @order }
  end

  private
  def cart_params
    params.require(:cart).permit(:quantity, :item_id, :order_id)
  end
end