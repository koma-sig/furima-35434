class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipment_id, :municipality, :address, :building_name, :phone_number, :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :shipment_id, numericality: { other_than: 1 }
    validates :municipality
    validates :address
    validates :phone_number,format: { with:/\A[0-9]{10,11}\z/} 
    validates :token
  end
  
  def save
    # 各テーブルにデータを保存する処理を書く
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipment_id: shipment_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number,order_id: order.id)

  end
end