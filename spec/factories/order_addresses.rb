FactoryBot.define do
  before_action :user_item_params, only: [:user_id, :item_id]
  
  factory :order_address do
    postal_code { '111-1111' }
    shipment_id { 2 }
    municipality{ '盛岡'}
    address     { '1丁目1-1'}
    building_name{ 'testビルディング'}
    phone_number { '11111111111' }
    token        {"tok_abcdefghijk00000000000000000"}
  end

  private

  def user_item_params
    params.require(:order_address).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
