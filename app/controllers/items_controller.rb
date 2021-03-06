class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_editind_system, only: [:show, :edit,:update]
  before_action :move_to_index,only: [:edit, :update]

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

  def show
    
  end

  def edit
    if @item.order != nil
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if current_user.id == item.user_id 

      item.destroy
    end
    redirect_to root_path
  end


  private

  def item_params
    params.require(:item).permit(:image,:product, :product_description, :category_id, :product_status_id,:delivery_charge_id, :shipment_id, :shipping_days_id, :price ).merge(user_id: current_user.id)
  end

  def item_editind_system
    @item = Item.find(params[:id])
  end

  def move_to_index
    if current_user.id != @item.user_id
      redirect_to action: :index
    end
  end
  
end
