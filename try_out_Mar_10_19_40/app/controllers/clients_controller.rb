class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /clients
  # GET /clients.json
  def index
    @grocers = Grocer.all
    @orders = Client.find(current_user.id).orders
  end

  def grocer_item_list

  end

  def client_order_list
    @orders = Client.find(current_user.id).orders
  end

  def destroy_order
    @order = Order.find(params[:id])
    @order.destroy
    respond_to do |format|
      format.html { redirect_to client_order_list, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.fetch(:client, {})
    end
end
