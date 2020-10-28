class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
  end

  private
  def order_params
    params.require(:order_address).permit(:postal_code, :ship_region_id, :ship_city, :ship_block, :ship_building, :phone,).merge(
      user_id: current_user.id, item_id: params[:item_id])
  end
end
