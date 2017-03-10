class CartsController < ApplicationController
  def create
    @cart = Cart.new(cart_params)
    @cart.save!
  end

  private
  def cart_params
    params.require(:cart).permit(:quantity, :item_id, :order_id)
  end
end