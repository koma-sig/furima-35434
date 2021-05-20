class OrdersController < ApplicationController
  before_action :items_params,only: [:index, :create]
  before_action :authenticate_user!
  def index
    @order_address = OrderAddress.new
    redirect_to root_path if current_user.id == @item.user.id || @item.order != nil 
  end

  def create 
    @order_address = OrderAddress.new(order_params)
    redirect_to root_path if current_user.id == @item.user.id || @item.order != nil
    if @order_address.valid?  
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :shipment_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def items_params
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item[:price], 
        card: order_params[:token],    
        currency: 'jpy'                 
      )
  end
end
