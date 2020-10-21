class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    
  end


private
  def item_params
    params.require(:ieme).permit(:name, :description, :genre_id, :status_id,
      :ship_burden_id, :shipment_source_id, :days_to_id, :price).
        mage(user_id: current_user.id)
  end
end