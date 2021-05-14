class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.all.order(id: "DESC")
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
    params.require(:item).permit(:image,:product, :product_description, :category_id, :product_status_id,:delivery_charge_id, :shipment_id, :shipping_days_id, :price ).merge(user_id: current_user.id)
  end
end
