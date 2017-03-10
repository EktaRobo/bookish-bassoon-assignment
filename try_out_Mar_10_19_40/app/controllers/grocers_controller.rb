class GrocersController < ApplicationController
  before_action :set_grocer, only: [:show, :edit, :update, :destroy]
  before_action :set_items, only: [:show]
  before_action :set_order, only: [:show]
  before_action :set_cart, only: [:show]

  # GET /grocers
  # GET /grocers.json
  def index
    grocer = Grocer.find(current_user.id)
    @items = grocer.items
    @orders = grocer.orders
  end

  # GET /grocers/1
  # GET /grocers/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grocer
      @grocer = Grocer.find(params[:id])
    end

    def set_items
      @items = @grocer.items
    end

    def set_order
      @order = Order.new(:grocer_id => @grocer.id, :client_id => current_user.id, :order_status_id => 1)
      @order.save!
    end

    def set_cart
      @cart = Cart.new(:order_id => @order.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grocer_params
      params.fetch(:grocer, {})
    end
end
