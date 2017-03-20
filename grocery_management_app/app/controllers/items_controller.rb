class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :units_left]
  before_action :authenticate_user!

  # GET /items
  # GET /items.json
  def index
      @items = Item.where(:grocer_id => current_user.id)
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  def units_left
    units = @item.units_in_stock;
    ordered_units = params[:ordered_units].to_i
    units_left_in_stock = units - ordered_units
    @item.update(:units_in_stock => units_left_in_stock)
    redirect_to grocer_show_exisiting_order_path(:id => params[:grocer_id], :order_id => params[:order_id])
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @item.grocer_id = current_user.id

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :image, :price_per_unit, :unit, :units_in_stock)
    end
end
