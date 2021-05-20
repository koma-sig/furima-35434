FactoryBot.define do
  factory :order_address do
    user_id     { 0 }
    item_id     { 0 }
    postal_code { '111-1111' }
    shipment_id { 2 }
    municipality{ '盛岡'}
    address     { '1丁目1-1'}
    building_name{ 'testビルディング'}
    phone_number { '11111111111' }
    # order_id { 0 }
  end
end
