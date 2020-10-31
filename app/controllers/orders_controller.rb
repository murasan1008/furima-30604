class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
    redirect_to root_path if @item.user == current_user || @item.order != nil
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
     redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:postal_code, :ship_region_id, :ship_city, :ship_block, :ship_building, :phone,).merge(
      user_id: current_user.id, item_id: params[:item_id],token: params[:token],price: @item.price)
  end

  def pay_item
    Payjp.api_key = "sk_test_4419e0939e7a125a48bf62d5"
      Payjp::Charge.create(
        amount: order_params[:price],
        card: order_params[:token],
        currency: 'jpy'
      )
  end
end
