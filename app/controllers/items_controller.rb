class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @item = item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :genre_id, :status_id,
                                 :ship_burden_id, :shipment_source_id, :days_to_id, :price, :image).merge(user_id: current_user.id)
  end
end
